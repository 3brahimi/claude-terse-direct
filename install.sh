#!/usr/bin/env bash
# Installs the terse-direct Claude Code output style into ~/.claude/output-styles/
set -euo pipefail

RAW_BASE="https://raw.githubusercontent.com/3brahimi/terse-direct/main"
REFS="algorithmic-technique.md ascii-diagram-alignment.md avoid-signs-of-ai.md list-of-algorithms.md"
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/output-styles"

mkdir -p "$DEST/refs"

# Local checkout (script has terse-direct.md next to it) vs. piped install (curl | bash).
SRC="$(cd "$(dirname "${BASH_SOURCE[0]:-}")" 2>/dev/null && pwd || true)"
if [ -n "$SRC" ] && [ -f "$SRC/terse-direct.md" ]; then
  cp "$SRC/terse-direct.md" "$DEST/terse-direct.md"
  cp "$SRC"/refs/*.md "$DEST/refs/"
else
  curl -fsSL "$RAW_BASE/terse-direct.md" -o "$DEST/terse-direct.md"
  for f in $REFS; do
    curl -fsSL "$RAW_BASE/refs/$f" -o "$DEST/refs/$f"
  done
fi

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
