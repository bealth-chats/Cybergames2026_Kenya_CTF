set -eu
  TMP=$(mktemp /tmp/solve.XXXXXX.js)
  trap 'rm -f "$TMP"' EXIT
  head -c 65536 > "$TMP"
  exec timeout --kill-after=2 25 \
    /opt/d8 \
      --no-concurrent-recompilation \
      --no-liftoff \
      --no-wasm-tier-up \
      /opt/challenge.js -- "$TMP"
