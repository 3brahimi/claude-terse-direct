# Installs the terse-direct Claude Code output style into %USERPROFILE%\.claude\output-styles\
$ErrorActionPreference = "Stop"

$RawBase = "https://raw.githubusercontent.com/3brahimi/terse-direct/main"
$Refs = @("algorithmic-technique.md", "ascii-diagram-alignment.md", "avoid-signs-of-ai.md", "list-of-algorithms.md")
$ConfigDir = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { $env:USERPROFILE }
$Dest = Join-Path $ConfigDir ".claude\output-styles"

New-Item -ItemType Directory -Force -Path (Join-Path $Dest "refs") | Out-Null

# Local checkout (script has terse-direct.md next to it) vs. piped install (irm | iex, no $PSScriptRoot).
$Src = $PSScriptRoot
if ($Src -and (Test-Path (Join-Path $Src "terse-direct.md"))) {
    Copy-Item (Join-Path $Src "terse-direct.md") (Join-Path $Dest "terse-direct.md") -Force
    Copy-Item (Join-Path $Src "refs\*.md") (Join-Path $Dest "refs") -Force
} else {
    Invoke-WebRequest -Uri "$RawBase/terse-direct.md" -OutFile (Join-Path $Dest "terse-direct.md")
    foreach ($f in $Refs) {
        Invoke-WebRequest -Uri "$RawBase/refs/$f" -OutFile (Join-Path $Dest "refs\$f")
    }
}

Write-Host "Installed terse-direct to $Dest"

# Set as the global default output style (%USERPROFILE%\.claude\settings.json).
$StyleName = "Terse Direct"
$SettingsDir = Join-Path $ConfigDir ".claude"
$Settings = Join-Path $SettingsDir "settings.json"

New-Item -ItemType Directory -Force -Path $SettingsDir | Out-Null
if (-not (Test-Path $Settings)) { "{}" | Set-Content -Path $Settings -Encoding utf8 }

$json = Get-Content $Settings -Raw | ConvertFrom-Json -AsHashtable
if (-not $json) { $json = @{} }
$json["outputStyle"] = $StyleName
($json | ConvertTo-Json -Depth 32) | Set-Content -Path $Settings -Encoding utf8

Write-Host "Set outputStyle to `"$StyleName`" in $Settings"
