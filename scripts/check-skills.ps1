<#
.SYNOPSIS
  Check which software-engineering skills are present under a skills root and print fallbacks.
#>
param(
  [string]$SkillsRoot = $(if ($env:SKILLS_ROOT) { $env:SKILLS_ROOT } else { Join-Path $HOME ".agents\skills" })
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot

$Shipped = @(
  "engineering-design",
  "algorithm-design",
  "technical-design-review"
)

$OptionalThirdParty = @(
  "software-architecture",
  "software-architecture-analysis",
  "software-architecture-partner",
  "writing-technical-design",
  "api-design-and-evolution",
  "adr-authoring",
  "product-manager",
  "brainstorming",
  "writing-plans"
)

$Fallbacks = @{
  "software-architecture"            = "engineering-design/templates/architecture-design.md"
  "software-architecture-analysis"   = "evidence notes in design template"
  "software-architecture-partner"    = "skip"
  "writing-technical-design"         = "engineering-design/templates/technical-design.md"
  "api-design-and-evolution"         = "contracts section in design template"
  "adr-authoring"                    = "engineering-design/templates/adr.md"
  "algorithm-design"                 = "algorithm section in technical-design.md"
  "technical-design-review"          = "engineering-design/templates/design-review.md (self-review)"
  "product-manager"                  = "accept a clear technical brief without PRD"
  "brainstorming"                    = "lightweight clarify in orchestrator"
  "writing-plans"                    = "concise outline only if user asks"
}

function Test-Skill([string]$Root, [string]$Name) {
  return Test-Path (Join-Path (Join-Path $Root $Name) "SKILL.md")
}

Write-Host "Skills root: $SkillsRoot"
Write-Host "Repo root:   $RepoRoot"
Write-Host ""

Write-Host "== Shipped with this repository =="
$missingShipped = @()
foreach ($name in $Shipped) {
  $inRepo = Test-Skill $RepoRoot $name
  $inRoot = Test-Skill $SkillsRoot $name
  $status = if ($inRoot) { "OK in skills root" } elseif ($inRepo) { "IN REPO only (not installed to skills root)" } else { "MISSING" }
  if (-not $inRoot) { $missingShipped += $name }
  Write-Host ("  [{0}] {1}" -f ($(if ($inRoot) { "x" } else { " " })), "$name — $status")
}

Write-Host ""
Write-Host "== Optional third-party / planners on skills root =="
foreach ($name in $OptionalThirdParty) {
  $inRoot = Test-Skill $SkillsRoot $name
  if ($inRoot) {
    Write-Host ("  [x] {0}" -f $name)
  } else {
    $fb = $Fallbacks[$name]
    if (-not $fb) { $fb = "orchestrator standalone fallback (see standalone-operation.md)" }
    Write-Host ("  [ ] {0} — missing; fallback: {1}" -f $name, $fb)
  }
}

Write-Host ""
if ($missingShipped.Count -gt 0) {
  Write-Host "WARN: shipped skills not installed to skills root:"
  $missingShipped | ForEach-Object { Write-Host "  - $_" }
  Write-Host "Install with scripts/install-skills.ps1 (or copy/symlink folders into `$SkillsRoot)."
  exit 1
}

Write-Host "All shipped skills are present under the skills root."
exit 0
