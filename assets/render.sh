#!/usr/bin/env bash
# Renders the project's images from their HTML sources with headless Chrome.
# Output: assets/docking-diagram-light.png and assets/docking-diagram-dark.png (2x),
#         docs/og-image.png (the 1200x630 link preview, 1x by spec).
# Usage: ./assets/render.sh   (run from anywhere; paths resolve relative to this script)
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$DIR/.." && pwd)"
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

# Evidence chart: what carries the effect. Same 2x treatment as the diagram.
for theme in light dark; do
  "$CHROME" --headless --disable-gpu --hide-scrollbars \
    --force-device-scale-factor=2 \
    --window-size=780,424 \
    --virtual-time-budget=2000 \
    --screenshot="$DIR/evidence-chart-${theme}.png" \
    "file://$DIR/evidence-chart.html?theme=${theme}" >/dev/null 2>&1
  echo "rendered assets/evidence-chart-${theme}.png"
done

# Overview map: the architecture, deliberately free of any figures.
for theme in light dark; do
  "$CHROME" --headless --disable-gpu --hide-scrollbars \
    --force-device-scale-factor=2 \
    --window-size=940,640 \
    --virtual-time-budget=2000 \
    --screenshot="$DIR/overview-map-${theme}.png" \
    "file://$DIR/overview-map.html?theme=${theme}" >/dev/null 2>&1
  echo "rendered assets/overview-map-${theme}.png"
done

# Link preview: exactly 1200x630, so no device-scale factor here.
"$CHROME" --headless --disable-gpu --hide-scrollbars \
  --force-device-scale-factor=1 \
  --window-size=1200,630 \
  --virtual-time-budget=2000 \
  --screenshot="$ROOT/docs/og-image.png" \
  "file://$DIR/og-image.html" >/dev/null 2>&1
echo "rendered docs/og-image.png"
