#!/usr/bin/env bash
# Renders the README images from assets/docking-diagram.html with headless Chrome.
# Output: assets/docking-diagram-light.png and assets/docking-diagram-dark.png (2x).
# Usage: ./assets/render.sh   (run from anywhere; paths resolve relative to this script)
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="file://$DIR/docking-diagram.html"

CHROME="${CHROME:-}"
if [ -z "$CHROME" ]; then
  for c in \
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
    "/Applications/Chromium.app/Contents/MacOS/Chromium" \
    "$(command -v google-chrome || true)" \
    "$(command -v chromium || true)"; do
    [ -x "$c" ] && CHROME="$c" && break
  done
fi
[ -n "$CHROME" ] || { echo "No Chrome/Chromium found. Set CHROME=/path/to/chrome" >&2; exit 1; }

# Window size matches the diagram's aspect ratio; 2x device scale for a crisp image.
WIDTH=920
HEIGHT=452

for theme in light dark; do
  "$CHROME" --headless --disable-gpu --hide-scrollbars \
    --force-device-scale-factor=2 \
    --window-size="${WIDTH},${HEIGHT}" \
    --default-background-color=00000000 \
    --virtual-time-budget=2000 \
    --screenshot="$DIR/docking-diagram-${theme}.png" \
    "${SRC}?theme=${theme}" >/dev/null 2>&1
  echo "rendered assets/docking-diagram-${theme}.png"
done
