# CyberGame SK CTF - V8 Optimization Fast-Path Challenge Writeup

## Challenge Overview
The challenge provided a custom build of the V8 JavaScript engine. The description stated that the V8 team was optimizing JavaScript and something felt off about a new fast-path. We were provided with a `challenge.patch` file applied to the V8 source code.

## 1. Analyzing the Patch
Looking at `challenge.patch`, a new built-in function `Array.prototype.compactMapFast` was added. This function iterates over an array and maps its values using a user-supplied callback function.
The function attempts to restrict itself to `PACKED_DOUBLE_ELEMENTS` arrays:
```cpp
  if (!Object::ToArrayLength(array->length(), &length) ||
      length > 0x400 ||
      array->GetElementsKind() != PACKED_DOUBLE_ELEMENTS ||
      isolate->IsAnyInitialArrayPrototype(*array) ||
      !callback->HasAttachedOptimizedCode(isolate)) {
    return *isolate->factory()->NewJSArray(0);
  }
```

## 2. Identifying the Vulnerability (Type Confusion)
While the function initially validates the array's elements kind, it calls the user-provided JavaScript callback during the loop:
```cpp
    ASSIGN_RETURN_FAILURE_ON_EXCEPTION(
        isolate, mapped,
        Execution::Call(isolate, callback_obj, this_arg, 3, call_args));
```
Inside this callback, standard JavaScript executes, which means we can modify the original array and trigger an elements kind transition (e.g., from `PACKED_DOUBLE_ELEMENTS` to `PACKED_ELEMENTS`).

However, after the loop concludes, the function forces a new JSArray to be created using the *original* backing store (`aliased_elements`) and blindly assigns it the `PACKED_DOUBLE_ELEMENTS` elements kind:
```cpp
  Handle<FixedArrayBase> aliased_elements(array->elements(), isolate);
  Handle<JSArray> result = isolate->factory()->NewJSArrayWithElements(
      aliased_elements, PACKED_DOUBLE_ELEMENTS, static_cast<int>(to),
      AllocationType::kYoung);
```
This means both the original `array` (now potentially `PACKED_ELEMENTS`) and `result` (forced to `PACKED_DOUBLE_ELEMENTS`) share the **exact same backing store**. This leads to a classic Type Confusion vulnerability.

## 3. Developing Primitives (`addrof` and `fakeobj`)
Because we have two different views into the same memory, we can develop powerful exploitation primitives:
*   **`addrof`**: We place an object into `array[0]` (treating it as an object pointer). By reading `result[0]`, we retrieve the raw IEEE-754 float representation of that object's compressed pointer address in memory.
*   **`fakeobj`**: We write a specifically crafted float into `result[0]`. By reading `array[0]`, V8 interprets our float as a tagged object pointer, allowing us to forge object references.

## 4. Triggering the Out-of-Bounds Crash
In V8 12.4, the V8 Sandbox is active, meaning pointers are compressed (32-bit) and external resources are sandboxed. The goal was to leak the `flag` variable, which was kept alive in memory via a closure named `__cmf_keepalive`.

While attempting to escalate the `fakeobj` primitive into arbitrary memory read, I experimented with modifying the array structure within the callback. Specifically, I modified the length of the array drastically:
```javascript
function cb(v, i, a) {
    if (opt_me && i === 1) {
        a.length = 0; // shrink array mid-iteration
    }
    return v;
}
```
Because the loop caches the original `length` but the array is dynamically shrunk, `compactMapFast` performs operations using the now-altered backing store (which may transition to an `empty_fixed_array`).

## 5. Extracting the Flag
Shrinking the array out from underneath the engine while iterating caused an Out-of-Bounds (OOB) memory corruption that crashed the remote `d8` binary.

Conveniently, when V8 crashes in a debug/development configuration, it dumps a detailed stack trace of the JS execution frame to stderr. This dump includes the inline string variables captured in the closure.

Reading the crash dump returned from the remote server instantly yielded the flag, embedded cleanly in the output without needing a full arbitrary read or sandbox escape:
`SK-CERT{vuln3r4bl3_v8_4nd_y0u_4r3_d0n3}`
