#!/usr/bin/env bash
# Installs the terse-direct Claude Code output style into ~/.claude/output-styles/
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/output-styles"

mkdir -p "$DEST/refs"
cp "$SRC/terse-direct.md" "$DEST/terse-direct.md"
cp "$SRC"/refs/*.md "$DEST/refs/"

echo "Installed terse-direct to $DEST"

# Set as the global default output style (~/.claude/settings.json).
STYLE_NAME="Terse Direct"
SETTINGS="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/settings.json"
[ -f "$SETTINGS" ] || echo '{}' > "$SETTINGS"

if command -v jq >/dev/null 2>&1; then
  tmp="$(mktemp)"
  jq --arg style "$STYLE_NAME" '.outputStyle = $style' "$SETTINGS" > "$tmp"
  mv "$tmp" "$SETTINGS"
else
  python3 - "$SETTINGS" "$STYLE_NAME" <<'PY'
import json, sys
path, style = sys.argv[1], sys.argv[2]
with open(path) as f:
    data = json.load(f)
data["outputStyle"] = style
with open(path, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
PY
fi

echo "Set outputStyle to \"$STYLE_NAME\" in $SETTINGS"
