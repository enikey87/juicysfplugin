#!/usr/bin/env bash
# juce_vst3_helper is a win32 executable that JUCE cross-builds to generate a
# moduleinfo.json inside the VST3 bundle. We cross-compile from Linux and cannot
# run it without wine. moduleinfo.json is metadata; the .vst3 module itself is
# already built by the time this runs. Emit an empty JSON so the build target
# succeeds; hosts fall back to introspecting the module directly.
out=""
while [ $# -gt 0 ]; do
  case "$1" in
    -output) out="$2"; shift 2 ;;
    *) shift ;;
  esac
done
if [ -n "$out" ]; then
  mkdir -p "$(dirname "$out")"
  echo "{}" > "$out"
fi
>&2 echo "juce_vst3_helper (noop shim) wrote {} to $out"
