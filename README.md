# terse-direct

A Claude Code output style: terse, direct, no AI-writing tics. Based on Orwell's six rules for prose, plus tool-use priority rules for code tasks (knowledge-graph lookup before grep, naming algorithmic technique before implementing, ASCII diagrams generated not hand-typed).

## Install

```sh
git clone <this-repo-url>
cd terse-direct
./install.sh
```

Then in Claude Code:

```
/output-style terse-direct
```

## What's in here

- `terse-direct.md` — the output style definition
- `refs/` — supporting reference docs the style links to (algorithmic technique selection, algorithm catalog, ASCII diagram alignment)
