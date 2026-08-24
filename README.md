# terse-direct

A Claude Code output style: terse, direct, no AI-writing tics.

Claude's default prose leans on hedges, praise, filler, and em dashes. This style cuts that out. It runs on Orwell's six rules for plain prose, a hard ban on sycophancy, hedging, puffery, filler, and em dashes, plus a fixed order for code tasks: check a knowledge-graph or index tool before grep, name the algorithmic technique before you build it, check for an existing algorithm before you invent one, and script any ASCII or Unicode diagram instead of typing it by hand. The bans hit every file Claude writes, not just chat replies. Docs, commit messages, and comments all count.

Only one output style is active at a time, and it applies to the main conversation only (a subagent runs its own system prompt; a fork inherits the parent's, so it's covered).

## Install

macOS/Linux, one-liner:

```sh
curl -fsSL https://raw.githubusercontent.com/3brahimi/terse-direct/main/install.sh | bash
```

Windows, PowerShell one-liner:

```powershell
irm https://raw.githubusercontent.com/3brahimi/terse-direct/main/install.ps1 | iex
```

Or clone first and run the script locally: `./install.sh` on macOS/Linux, `.\install.ps1` on Windows. Both work.

Either script copies the style into `~/.claude/output-styles/` and sets it as your global default by writing `outputStyle: "Terse Direct"` into `~/.claude/settings.json`. Takes effect after `/clear` or a new session; change it any time via `/config`.

## What's in here

- `terse-direct.md`: the output style itself
- `refs/`: reference docs the style links to (picking an algorithmic technique, an algorithm catalog, ASCII diagram alignment)
- `install.sh`, `install.ps1`: installers for macOS/Linux and Windows

## Credit

Masoud Ebrahimi ([3brahimi](https://github.com/3brahimi))
