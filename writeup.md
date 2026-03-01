# Malware Analysis CTF Challenge Write-up

## Challenge Description
We are given a Python program recovered from an unknown source. Its purpose is not immediately clear and documentation is unavailable. Analyze the program to understand its behavior. The flag format is `SK-CERT{...}`.

## Analysis Steps

### 1. Initial Inspection
Upon inspecting the `trueorfalse.py` script, we can see that it heavily obfuscates strings using variable assignments with Chinese characters.

```python
星要行以可和可国要和作=ord
就笑雪说此生就煌所是夏以会的就=lambda*码:"".join(map(chr,码))
```

There are multiple heavily obfuscated variables being loaded. At the very end of the script, we see the following line:
```python
无之可龙所会海在生是说一于=雪煌大雨雪来同一国虎雪中的道笑冬中要之海.loads(而大雪此就于来道道春(霜可人中霜行生国之行用之后明(梦霜然到风然然有行到人然会,虎国秋到明冬无大海而经人霜笑日大星冬用就) for 梦霜然到风然然有行到人然会,虎国秋到明冬无大海而经人霜笑日大星冬用就 in 经然光人云之树生龙用雨无生秋中虎可(日星行的梦在和于而也的此梦光,不风煌经笑不可于和夏然于事来而国就就的)))
getattr(__builtins__,就笑雪说此生就煌所是夏以会的就((True)+(True)+(True)...))(无之可龙所会海在生是说一于)
```

The `loads` call corresponds to `marshal.loads()`, and the final `getattr(__builtins__, ...)` executes the loaded code object using `exec()`.

### 2. Intercepting the Execution
To understand what the code is doing, we want to intercept the execution instead of running it blindly. We can achieve this by replacing the final `getattr(__builtins__, ...)` line with a print statement to see the object that `marshal.loads` outputs.

By changing the end of the script to:
```python
print(无之可龙所会海在生是说一于)
```

Running the modified script yields:
```
<code object <module> at 0x..., file "<obf>", line 1>
```

This confirms we are dealing with a compiled Python code object.

### 3. Disassembling the Code Object
Now that we have the code object, we can disassemble it using Python's built-in `dis` module to see the underlying bytecode instructions.

We create a wrapper script (`run.py`) that captures the output of executing our modified `trueorfalse.py` (which now uses `import dis; dis.dis(...)` instead of `exec(...)`).

```python
import subprocess

def analyze_code():
    result = subprocess.run(['python3', 'trueorfalse.py'], capture_output=True, text=True)
    with open('dis.txt', 'w') as f:
        f.write(result.stdout)

if __name__ == '__main__':
    analyze_code()
```

By substituting the `getattr` line with `import dis; dis.dis(无之可龙所会海在生是说一于)` in `trueorfalse.py`, we execute the script and analyze the output in `dis.txt`.

### 4. Extracting the Flag
Looking at the disassembled instructions near the end of the script (`tail -n 100 dis.txt`), we see the actual malware functionality:

```
  3        2502 PUSH_NULL
           2504 EXTENDED_ARG             1
           2506 LOAD_NAME              501 (print)
           2508 LOAD_CONST              38 ('--- malware succesfully executed ---')
           2510 UNPACK_SEQUENCE          1
           2514 CALL                     1
           2522 CACHE
           2524 POP_TOP

  4        2526 PUSH_NULL
           ...
           2532 LOAD_CONST              39 ('enumerating victim system:')
           ...

  6        ...
           2618 LOAD_CONST              41 ('SK-CERT{w0w0w0w0_u_f0und_m33333_u_Pr0_M4lw_4n4ly57_6j}')
           2620 COMPARE_OP               3 (<)
           ...

  7        ...
           2634 LOAD_CONST              42 ('-------\npersistence added\nransomware will be silently executed in 5 minutes\n')
           ...
```

The script prints some decoy messages and does a comparison with our target string! The flag is found plainly sitting in the `LOAD_CONST` instruction on line 2618.

**Flag:** `SK-CERT{w0w0w0w0_u_f0und_m33333_u_Pr0_M4lw_4n4ly57_6j}`
