<#
.SYNOPSIS
  Copy or symlink shipped skills from this repo into a host skills root.
#>
param(
  [string]$SkillsRoot = $(if ($env:SKILLS_ROOT) { $env:SKILLS_ROOT } else { Join-Path $HOME ".agents\skills" }),
  [ValidateSet("copy", "symlink")]
  [string]$Mode = "copy",
  [switch]$Force
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$Shipped = @(
  "engineering-design",
  "algorithm-design",
  "technical-design-review"
)

New-Item -ItemType Directory -Force $SkillsRoot | Out-Null
Write-Host "Installing into: $SkillsRoot (mode=$Mode)"

foreach ($name in $Shipped) {
  $src = Join-Path $RepoRoot $name
  $dst = Join-Path $SkillsRoot $name
  if (-not (Test-Path (Join-Path $src "SKILL.md"))) {
    Write-Host "Skip missing package: $name"
    continue
  }
  if (Test-Path $dst) {
    if (-not $Force) {
      Write-Host "Skip existing: $dst"
      continue
    }
    Remove-Item -Recurse -Force $dst
  }
  if ($Mode -eq "symlink") {
    New-Item -ItemType SymbolicLink -Path $dst -Target $src | Out-Null
  } else {
    Copy-Item -Recurse $src $dst
  }
  Write-Host "Installed $name"
}

& (Join-Path $PSScriptRoot "check-skills.ps1") -SkillsRoot $SkillsRoot
