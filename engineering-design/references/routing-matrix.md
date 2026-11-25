# Routing matrix

## A. Classify complexity

Score each factor 0–3 (0=none, 3=severe). Level = max factor, with upgrades:

| Factor | Questions |
|--------|-----------|
| Blast radius | How many modules/systems/teams touched? |
| Risk | Data loss, security, money, compliance, irreversible migration? |
| Uncertainty | New tech, unknown performance, unclear domain rules? |
| Algorithmic depth | Non-trivial search/optimize/rules/LLM-hybrid? |
| Contract change | Public API/schema/compatibility? |
| Reversibility | Easy rollback vs hard cutover? |

Mapping:

- All factors ≤1 and local UI/copy/bugfix → **L0**
- Max = 1, or max = 2 with narrow clear approach → **L1**
- Max = 2 with multi-module / algorithm / contracts / concurrency / AI workflow → **L2**
- Max = 3 or architecture/platform/migration-shaped → **L3**

**Upgrade rules:** critical data, security, compatibility, or core algorithm → at least L2 even if the diff is small.

## B. Mode → stages

| Mode | L0 | L1 | L2 | L3 |
|------|----|----|----|----|
| new-system-architecture | n/a (at least L2) | rare | 1,3,4,5,7,(8) | 1–8 full |
| new-feature-design | analyze only | 1,2,5 light, tests | 1–7 | treat as subsystem → L3 path |
| brownfield-refactor | n/a | small deepen | 1,2,3,4,5,7 | 1–8 + migration |
| algorithm-design | n/a | light algo + tests | 1,2, algorithm specialist, 7 | + architecture if system shape changes |
| tech-selection | n/a | short tradeoff memo | tradeoff + partner/eval + ADR if sticky | architecture + ADR |
| performance-design | n/a | measure+patch design | 2,5, specialist as needed, 7 | + architecture capacity |
| api-data-contract | n/a | compact contract | api specialist + 7 | + landscape/evolution |
| ai-agent-workflow | n/a | light | 1–7 + algorithm/API as needed | + architecture |
| design-doc-improvement | n/a | patch gaps | fill missing stages + 7 | full gap closure + 7 |
| independent-review | rare | review light | **stage 7 only** | stage 7 (+ read linked evidence) |

Stage 8 (implementation plan) only when user wants build-out and gates pass.

## C. Capability routing

| Signal in the task | Primary | Supplement |
|--------------------|---------|------------|
| Map existing code / as-is architecture | `software-architecture-analysis` | `software-architecture-partner` |
| Target architecture / boundaries / distribution | `software-architecture` | `software-architecture-partner` |
| Detailed module/interface/data design | `writing-technical-design` | partner templates |
| Public/internal API or events | `api-design-and-evolution` | — |
| Hard-to-reverse decision record | `adr-authoring` | architecture brief |
| Matching/ranking/scheduling/rules/LLM-hybrid | `algorithm-design` | — |
| Review / find holes | `technical-design-review` if installed, else self-review template | — |
| Clarify product intent (optional) | Planner pack `brainstorming` if present | — |
| Plan tasks after approval (optional) | Planner pack `writing-plans` if present | — |

## D. Simulated routing examples

| Request | Level | Mode | Load |
|---------|-------|------|------|
| Adjust button style/margin | L0 | new-feature-design (degenerate) | No full design docs |
| User settings + persistence | L1 | new-feature-design | Light design + data contract + tests |
| Multi-stage video shot match/filter/rank/arrange | L2 | algorithm-design + feature | analysis → detailed design → `algorithm-design` → review |
| Desktop app → plugin + IPC platform | L3 | brownfield-refactor / new-system | analysis → options → `software-architecture` → contracts → migration → review |
| Check an existing technical design for holes | — | independent-review | `technical-design-review` only |

## E. Conflict policy

If two skills overlap, **one primary** owns the artifact; supplements only fill named gaps. Do not run two full parallel design workflows. Never A→B→A skill loops.
