#!/usr/bin/env bash
# Zips every skill folder (any dir containing SKILL.md) into dist/<skill-name>.zip
# ready for upload to Claude.ai / Claude desktop (Settings → Capabilities → Skills).
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
find skills -name SKILL.md | while read -r f; do
  dir="$(dirname "$f")"; name="$(basename "$dir")"
  rm -f "dist/$name.zip"
  (cd "$(dirname "$dir")" && zip -rq "$OLDPWD/dist/$name.zip" "$name" -x '*.DS_Store')
  echo "packaged dist/$name.zip"
done
