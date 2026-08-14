#!/usr/bin/env bash
# Installs the terse-direct Claude Code output style into ~/.claude/output-styles/
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/output-styles"

mkdir -p "$DEST/refs"
cp "$SRC/terse-direct.md" "$DEST/terse-direct.md"
cp "$SRC"/refs/*.md "$DEST/refs/"

echo "Installed terse-direct to $DEST"
echo "Enable it in Claude Code with: /output-style terse-direct"
