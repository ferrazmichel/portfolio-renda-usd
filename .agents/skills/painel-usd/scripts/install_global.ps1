$ErrorActionPreference = 'Stop'

$sourceDir = Split-Path -Parent $PSScriptRoot
$targetDir = Join-Path $env:USERPROFILE '.gemini\config\skills\painel-usd'
$targetScripts = Join-Path $targetDir 'scripts'

New-Item -ItemType Directory -Path $targetScripts -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $sourceDir 'SKILL.md') -Destination (Join-Path $targetDir 'SKILL.md') -Force
Copy-Item -Path (Join-Path $sourceDir 'scripts\*') -Destination $targetScripts -Recurse -Force

Write-Output "Skill painel-usd instalada globalmente em: $targetDir"
