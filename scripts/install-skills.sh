#!/usr/bin/env bash
# Copy or symlink shipped skills from this repo into a host skills root.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_ROOT="${SKILLS_ROOT:-$HOME/.agents/skills}"
MODE="${1:-copy}" # copy | symlink
FORCE="${FORCE:-0}"

shipped=(
  engineering-design
  algorithm-design
  technical-design-review
)

mkdir -p "$SKILLS_ROOT"
echo "Installing into: $SKILLS_ROOT (mode=$MODE)"

for name in "${shipped[@]}"; do
  src="$REPO_ROOT/$name"
  dst="$SKILLS_ROOT/$name"
  if [[ ! -f "$src/SKILL.md" ]]; then
    echo "Skip missing package: $name"
    continue
  fi
  if [[ -e "$dst" ]]; then
    if [[ "$FORCE" != "1" ]]; then
      echo "Skip existing: $dst"
      continue
    fi
    rm -rf "$dst"
  fi
  if [[ "$MODE" == "symlink" ]]; then
    ln -s "$src" "$dst"
  else
    cp -R "$src" "$dst"
  fi
  echo "Installed $name"
done

"$REPO_ROOT/scripts/check-skills.sh"
