---
name: technical-design-review
description: >-
  Independently reviews architecture, technical, and algorithm designs for correctness,
  completeness, hidden assumptions, conflicts, risks, implementability, and over-design.
  Use when engineering-design routes here, or when the user asks to review, critique, or
  find holes in an existing technical design, architecture brief, ADR set, or algorithm
  design. Prefer engineering-design as the unified entry for broader design work.
disable-model-invocation: true
---

# Technical Design Review

Review designs as a **skeptical second reader**, not as the original author defending the plan.

> Prefer unified entry `engineering-design`. For "only review this doc", this skill may run directly.

## Stance

- Assume the design may be wrong, incomplete, or overfitted to a preferred solution.
- Demand evidence for load-bearing claims.
- Prefer concrete counterexamples over abstract concerns.
- Do **not** invent issues to fill a report. Empty "no P0/P1 found" is a valid outcome.
- Do **not** rewrite the whole design unless asked; focus on findings and required fixes.

## Inputs

Accept one or more of:

- Architecture / technical design docs
- Algorithm design docs
- ADRs
- Linked code or diagrams cited by the design

If the user points at a path, read it. If critical referenced code is claimed but missing, that is a finding.

## Review workflow

```text
Review progress:
- [ ] Scope and review mode stated
- [ ] Claims inventory (facts vs assumptions vs open questions)
- [ ] Problem fit check
- [ ] Structure / responsibility / interface check
- [ ] Algorithm / rules / state check (if applicable)
- [ ] Failure, concurrency, consistency, compatibility check
- [ ] Performance / complexity / operability check
- [ ] Testability / acceptance check
- [ ] Over-design check
- [ ] Findings written with severity and verification
- [ ] Gate recommendation: pass | revise | block
```

### Severity

| Level | Meaning |
|-------|---------|
| **P0** | Blocking: wrong, unsafe, or unimplemented critical behavior; must fix before planning/coding |
| **P1** | Important: likely defect or major gap; should fix before implementation |
| **P2** | Improvement: clarity, maintainability, or secondary risk |

### Finding format (required)

For each finding:

1. Severity (P0/P1/P2)
2. Problem statement
3. Location (doc section and/or code evidence)
4. Trigger scenario or counterexample
5. Impact
6. Suggested fix
7. Verification after fix

## Checklist lenses

Load [references/review-lenses.md](references/review-lenses.md) when reviewing L2/L3 designs or when the first pass is inconclusive.

Minimum always check:

1. Does the design solve the **real problem** (not only the requested mechanism)?
2. Are load-bearing **assumptions** labeled and testable?
3. Are module responsibilities overlapping or orphaned?
4. Are data shapes and interface semantics unambiguous?
5. Can the core algorithm/rules be implemented without new critical decisions?
6. Are conflicts, edge cases, and undefined behaviors handled?
7. Are failure/retry paths state-safe?
8. Are performance and resource claims plausible?
9. Is there over-design relative to stated constraints?
10. Can tests falsify the design's critical claims?

## Independent review agent (when available)

If the environment supports a separate read-focused sub-agent:

- Give it the design docs + relevant code paths only
- Ask for findings in the template format
- Do not give it write/implement permissions
- Merge and de-duplicate findings yourself

If a separate agent is unavailable, run this skill as a distinct review phase and state that limitation.

## Outputs

Use [templates/design-review.md](templates/design-review.md).

End with an explicit gate:

- **pass** — no open P0; P1s accepted by user or fixed
- **revise** — must return to design before planning
- **block** — unsafe or fundamentally misframed
