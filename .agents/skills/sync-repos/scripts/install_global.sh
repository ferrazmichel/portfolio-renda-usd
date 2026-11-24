#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
SOURCE_DIR="$(cd "$SCRIPT_DIR/.." && pwd -P)"
TARGET_DIR="$HOME/.gemini/config/skills/sync-repos"
TARGET_SCRIPTS="$TARGET_DIR/scripts"

mkdir -p "$TARGET_SCRIPTS"
cp -f "$SOURCE_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"
cp -Rf "$SOURCE_DIR/scripts/." "$TARGET_SCRIPTS/"
chmod +x "$TARGET_SCRIPTS"/*.sh

echo "Skill sync-repos instalada globalmente em: $TARGET_DIR"

