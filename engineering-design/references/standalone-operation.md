# Standalone / degraded operation

## What this repo ships

Always expected after `scripts/install-skills`:

- `engineering-design`
- `algorithm-design`
- `technical-design-review`

If a **shipped** sibling is missing from the skills root, prefer re-running install. Temporary fallbacks still exist (below).

## Optional third-party

Names such as `software-architecture`, `writing-technical-design`, `api-design-and-evolution` are **not** in this repo. Use only if present.

## Before loading any specialist

1. Resolve sibling path under the active skills root.
2. If `SKILL.md` is missing → **do not invent** that the skill ran.
3. Use the fallback and note `specialist missing: <name>`.

## Fallbacks

| Need | Preferred | Fallback |
|------|-----------|----------|
| Route / depth | shipped orchestrator | [routing-matrix.md](routing-matrix.md) |
| L1–L3 docs | shipped templates | `templates/*.md` |
| Architecture | optional `software-architecture*` | [../templates/architecture-design.md](../templates/architecture-design.md) |
| Detailed design | optional `writing-technical-design` | [../templates/technical-design.md](../templates/technical-design.md) |
| Algorithms | **shipped** `algorithm-design` | algorithm section in technical-design template |
| Review | **shipped** `technical-design-review` | [../templates/design-review.md](../templates/design-review.md) labeled self-review |
| ADR | optional `adr-authoring` | [../templates/adr.md](../templates/adr.md) |
| Planners | optional brainstorming/writing-plans | skip |

Run `scripts/check-skills` to print the live matrix.
