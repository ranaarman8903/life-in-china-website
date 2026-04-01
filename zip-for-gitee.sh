#!/usr/bin/env bash
# Build a clean archive for Gitee: no __MACOSX, .DS_Store, or ._ AppleDouble files.
# Finder "Compress" adds that junk; this script does not.
#
# Usage:
#   ./zip-for-gitee.sh                    → writes Desktop/life-in-china-website-gitee.zip
#   ./zip-for-gitee.sh /path/to/out.zip   → custom output path

set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
OUT="${1:-$HOME/Desktop/life-in-china-website-gitee.zip}"

# Zip from inside the project so the archive root is index.html, css/, img/, …
(
  cd "$ROOT"
  zip -r "$OUT" . \
    -x "*.DS_Store" \
    -x "**/.DS_Store" \
    -x "**/__MACOSX/**" \
    -x "**/._*" \
    -x ".git/**" \
    -x "**/.git/**" \
    -x "*.zip" \
    -x "zip-for-gitee.sh"
)

echo "Created: $OUT"
echo "Upload or extract this file for Gitee — it should not contain __MACOSX or ._ files."
