---
name: engineering-design
description: >-
  Unified software engineering design entry for architecture, features, refactors,
  algorithms, API/data contracts, technical selection, performance designs, AI agent
  workflows, and independent design review. Use when the user invokes /engineering-design
  or asks to design, architect, compare technical options, deepen a spec, or review a
  technical design. Classifies complexity L0–L3, progressively loads specialist skills,
  optionally collaborates with planner packs when present on the host, and stops at
  design unless implementation is requested. Not for trivial Q&A, pure copy edits,
  or one-line style tweaks.
---

# Engineering Design

Cross-project **unified entry** for software engineering design. You orchestrate specialists; you do not dump every framework into context.

## First actions (every run)

1. Read the user goal. Infer **mode** and **complexity (L0–L3)**.
2. Read [references/standalone-operation.md](references/standalone-operation.md) — this repo ships the orchestrator only; most registry names are optional.
3. Load only what you need next:
   - [references/routing-matrix.md](references/routing-matrix.md) when unsure about level/mode
   - [references/skill-registry.md](references/skill-registry.md) before invoking any specialist
4. Discover **current project context on demand** (stack, modules, docs, constraints, relevant code). Do not scan the whole repo blindly.
5. If optional planner skills (e.g. brainstorming / writing-plans) are available and useful, read [references/superpowers-integration.md](references/superpowers-integration.md). They are **optional** and host-dependent.

**Missing specialists:** If a sibling `SKILL.md` is absent, use the fallback in standalone-operation / registry. Never invent that an optional skill ran. Never block the user waiting for an uninstalled skill. Prefer completing design with built-in templates.

## Modes

Pick one primary mode (compose only when needed):

| Mode | Focus |
|------|--------|
| new-system-architecture | Greenfield system shape |
| new-feature-design | Feature / module technical design |
| brownfield-refactor | Existing system restructure |
| algorithm-design | Algorithm-intensive core |
| tech-selection | Options + tradeoffs |
| performance-design | Latency, throughput, resources |
| api-data-contract | API / protocol / schema contracts |
| ai-agent-workflow | Agent / LLM / workflow systems |
| design-doc-improvement | Strengthen an existing design |
| independent-review | Review only — skip full design lifecycle |

## Complexity

| Level | Meaning | Default depth |
|-------|---------|----------------|
| **L0** | Tiny, low-risk change | Light analysis; no full design doc |
| **L1** | Ordinary feature, clear approach | Lightweight design + tests |
| **L2** | Complex logic / multi-module / contracts / concurrency / AI workflow | Detailed design + specialists + review |
| **L3** | Architecture-level / major refactor / core platform choice | Full architecture + migration + review |

Upgrade the level when critical data, safety, compatibility, or core algorithms are at stake—even if the diff looks small.

## Progressive loading

**Never** preload all specialists.

Resolve specialist paths relative to this skill's sibling directories under the user skills root (same parent as `engineering-design/`). Read that specialist's `SKILL.md`, then only the references/templates it says to load.

Optional specialists are catalogued in [references/skill-registry.md](references/skill-registry.md). Cite a skill only after verifying its sibling `SKILL.md` exists.

## Standard stages (subset by level/mode)

1. **Understand** — goals, real problem, constraints, non-goals, success criteria; facts vs inferences vs open questions  
2. **Analyze existing system** — evidence from code/docs; root cause; reuse opportunities  
3. **Options & decisions** — candidates, tradeoffs, recommendation; ADR when irreversible/high-risk  
4. **Architecture** — boundaries, responsibilities, dependencies, flows, lifecycle constraints  
5. **Detailed design** — interfaces, data, algorithms, rules, failures, perf, compatibility, tests (only relevant sections)  
6. **Specialists** — algorithm / API / analysis / partner skills as needed  
7. **Independent review** — required for L2/L3 before planning; use `technical-design-review` **if installed**, otherwise a skeptical self-review with [templates/design-review.md](templates/design-review.md) (label clearly)  
8. **Implementation plan** — only after design approval; do not invent new critical architecture while planning  

For **independent-review** mode: jump to stage 7.  
For **L0**: stop after lightweight analysis.  
If the user asked **design only**: stop before coding.

## Quality gates

Before implementation planning on L2/L3, enforce [references/quality-gates.md](references/quality-gates.md). Fail closed: return to the incomplete stage.

## Templates

Pick one primary template; do not fill irrelevant sections:

- L1: [templates/lightweight-design.md](templates/lightweight-design.md)
- L2: [templates/technical-design.md](templates/technical-design.md)
- L3: [templates/architecture-design.md](templates/architecture-design.md)
- Decisions: [templates/adr.md](templates/adr.md)
- Review: [templates/design-review.md](templates/design-review.md)

Follow the **current project's** doc placement conventions. Do not force duplicate docs.

## Anti-patterns

- Loading every specialist "just in case"
- Circular skill-to-skill summoning
- Generating architecture docs for button padding (L0)
- Treating requirement confirmation as technical-design confirmation
- Starting to code when the user asked for design
- Copying another project's architecture into this one without evidence
- Padding docs instead of resolving decisions

## Provenance / maintenance

See [README.md](README.md) and [references/installed-sources.md](references/installed-sources.md).
