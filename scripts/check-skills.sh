#!/usr/bin/env bash
# Check which software-engineering skills are present under a skills root and print fallbacks.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_ROOT="${SKILLS_ROOT:-$HOME/.agents/skills}"

shipped=(
  engineering-design
  algorithm-design
  technical-design-review
)

optional=(
  software-architecture
  software-architecture-analysis
  software-architecture-partner
  writing-technical-design
  api-design-and-evolution
  adr-authoring
  product-manager
  brainstorming
  writing-plans
)

fallback_for() {
  case "$1" in
    software-architecture) echo "engineering-design/templates/architecture-design.md" ;;
    software-architecture-analysis) echo "evidence notes in design template" ;;
    software-architecture-partner) echo "skip" ;;
    writing-technical-design) echo "engineering-design/templates/technical-design.md" ;;
    api-design-and-evolution) echo "contracts section in design template" ;;
    adr-authoring) echo "engineering-design/templates/adr.md" ;;
    algorithm-design) echo "algorithm section in technical-design.md" ;;
    technical-design-review) echo "engineering-design/templates/design-review.md (self-review)" ;;
    product-manager) echo "accept a clear technical brief without PRD" ;;
    brainstorming) echo "lightweight clarify in orchestrator" ;;
    writing-plans) echo "concise outline only if user asks" ;;
    *) echo "orchestrator standalone fallback (see standalone-operation.md)" ;;
  esac
}

has_skill() {
  local root="$1" name="$2"
  [[ -f "$root/$name/SKILL.md" ]]
}

echo "Skills root: $SKILLS_ROOT"
echo "Repo root:   $REPO_ROOT"
echo

echo "== Shipped with this repository =="
missing_shipped=()
for name in "${shipped[@]}"; do
  if has_skill "$SKILLS_ROOT" "$name"; then
    echo "  [x] $name — OK in skills root"
  elif has_skill "$REPO_ROOT" "$name"; then
    echo "  [ ] $name — IN REPO only (not installed to skills root)"
    missing_shipped+=("$name")
  else
    echo "  [ ] $name — MISSING"
    missing_shipped+=("$name")
  fi
done

echo
echo "== Optional third-party / planners on skills root =="
for name in "${optional[@]}"; do
  if has_skill "$SKILLS_ROOT" "$name"; then
    echo "  [x] $name"
  else
    echo "  [ ] $name — missing; fallback: $(fallback_for "$name")"
  fi
done

echo
if ((${#missing_shipped[@]})); then
  echo "WARN: shipped skills not installed to skills root:"
  for name in "${missing_shipped[@]}"; do
    echo "  - $name"
  done
  echo "Install with scripts/install-skills.sh (or copy/symlink folders into \$SKILLS_ROOT)."
  exit 1
fi

echo "All shipped skills are present under the skills root."
exit 0
