(function (argv) {
  "use strict";

  const scriptName = (argv && argv.length > 0)
    ? argv[0]
    : "solve.js";
  const source = read(scriptName);
  let flag;
  try {
    flag = read("/flag.txt").trim();
  } catch (_) {
    flag = read("flag.txt").trim();
  }

  const marker = "cmf:closure:12.4:stable";
  const keepalive = (function (secret, markerValue) {
    const pad = [{ x: 0x1337 }, 13.37, markerValue];
    return function compactKeeper(n) {
      n = n | 0;
      if (n === 0x5eed) return markerValue.length + pad.length;
      return (secret.length ^ n) + pad.length;
    };
  })(flag, marker);

  Object.defineProperty(globalThis, "__cmf_probe", {
    value: marker,
    writable: false,
    enumerable: false,
    configurable: false,
  });

  Object.defineProperty(globalThis, "__cmf_keepalive", {
    value: keepalive,
    writable: false,
    enumerable: false,
    configurable: false,
  });

  for (const name of [
    "read",
    "readbuffer",
    "readline",
    "load",
    "quit",
    "os",
    "d8",
    "Realm",
    "Worker",
  ]) {
    try {
      Object.defineProperty(globalThis, name, {
        value: undefined,
        writable: false,
        enumerable: false,
        configurable: false,
      });
    } catch (_) {
    }
  }

  (0, eval)(source);
})(typeof arguments === "undefined" ? [] : arguments);
