# Skill capability registry

Paths are siblings of `engineering-design/` under the **active host’s skills root** (parent of this skill directory). Resolve with the parent of this skill directory; never hard-code a vendor path or a project repo path.

**Status legend**

| Status | Meaning |
|--------|---------|
| **shipped** | Included in this repository under `engineering-design/` |
| **optional** | Not shipped here. Use only if the sibling folder exists; otherwise follow [standalone-operation.md](standalone-operation.md) |

Before citing any **optional** skill, verify `../<name>/SKILL.md` exists. If missing, use the orchestrator fallback — do not pretend the specialist ran.

Legend: **Primary** = default owner when present; **Supplement** = load only for a clear gap.

| Capability | Primary skill | Path | Status | When to use | When not | Timing | Expected outputs | Fallback if missing |
|------------|---------------|------|--------|-------------|----------|--------|------------------|---------------------|
| Unified orchestration | `engineering-design` | this skill | **shipped** | Design / architect / review entry | Pure trivia, copy polish | Always first | Mode, level, design artifacts | — |
| Classify / route | `engineering-design` | [routing-matrix.md](routing-matrix.md) | **shipped** | Always | — | Stage 1 | Mode + level | — |
| Quality gates | `engineering-design` | [quality-gates.md](quality-gates.md) | **shipped** | Before planning L1–L3 | L0 | Gates | Pass/fail | — |
| Design templates | `engineering-design` | `../templates/` | **shipped** | Produce design docs | L0 | Stages 3–5 | Design artifacts | — |
| As-is architecture analysis | `software-architecture-analysis` | `../software-architecture-analysis/` | optional | Brownfield map, coupling | Greenfield-only | Stage 2 | Architecture map + evidence | Evidence-based notes in design template |
| Target architecture | `software-architecture` | `../software-architecture/` | optional | Boundaries, styles, tradeoffs | Reverse-eng only | Stages 3–4 L2/L3 | Architecture brief | templates/architecture-design.md |
| Architecture partner | `software-architecture-partner` | `../software-architecture-partner/` | optional | Tech eval / compact specs | Prefer primary for full L3 | Supplement 3–5 | Spec/ADR aids | Skip |
| Detailed technical design | `writing-technical-design` | `../writing-technical-design/` | optional | Deep component/interface design | L0; review-only | Stages 3–5 | Technical design doc | templates/technical-design.md |
| API / contracts | `api-design-and-evolution` | `../api-design-and-evolution/` | optional | REST/RPC/GraphQL/events | Product discovery | Stage 5 | API brief + evolution | Contracts section in design template |
| ADR authoring | `adr-authoring` | `../adr-authoring/` | optional | Durable decisions | Routine choices | After decision | ADR | templates/adr.md |
| Algorithm & complex rules | `algorithm-design` | `../algorithm-design/` | **shipped** | Matching/ranking/scheduling/LLM-hybrid | Pure CRUD | Stage 5–6 | Algorithm design | Algorithm section in technical-design.md |
| Independent design review | `technical-design-review` | `../technical-design-review/` | **shipped** | Critique designs | Authoring first draft | Stage 7 | Review + gate | templates/design-review.md self-review |
| Optional brainstorming | `brainstorming` | host/plugin | optional | Fuzzy intent | Already clear | Stage 1 | Clarified intent | Lightweight clarify in orchestrator |
| Optional planning | `writing-plans` | host/plugin | optional | Plan after approved design | Before gates pass | Stage 8 | Task plan | Concise outline only if user asks |

## Do not cite as available unless installed

| Name | Reason |
|------|--------|
| mblode `codebase-architecture` | Strong TypeScript/Next.js bias; optional alternative only |
| edhahn original name `software-architecture` | Often renamed to `software-architecture-partner` to avoid clashes |
| magnus `programming-principles` / book full refs | Licensing & bulk risk |
| magnus `migration-engineering`, `data-architect`, etc. | Not part of this repo’s default set |
| github/awesome-copilot `agent-architecture` | Catalog availability varies |
| BMAD-METHOD full framework | Competing full SDLC; not bundled |

## Invocation method

Most Agent Skills hosts do not provide a native function-call / RPC between skills. **Read** the target `SKILL.md` only when the file exists, then follow its workflow. Never pretend a skill was executed without reading it.
