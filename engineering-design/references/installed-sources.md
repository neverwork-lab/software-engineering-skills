# Skills catalog for software-engineering-skills

## Shipped in this repository

These folders are published with the repo (MIT). Install them as siblings under your agent skills root.

| Skill | Role | Provenance |
|-------|------|------------|
| `engineering-design` | Orchestrator | This project |
| `algorithm-design` | Algorithm-intensive design | Companion in this repo — **not** lingzhi227’s paper/LaTeX `algorithm-design` |
| `technical-design-review` | Design review | Companion in this repo — related third-party design-review skills exist, but this folder is not a vendored copy |

See each skill’s `PROVENANCE.md`.

## Optional third-party (install separately)

Verify `../<name>/SKILL.md` exists before use. If absent → [standalone-operation.md](standalone-operation.md).

Pinned commits are examples — re-check upstream before installing.

| Name | Upstream | Commit (example) | License | Notes |
|------|----------|------------------|---------|-------|
| `software-architecture` | [magnus919/agent-skills](https://github.com/magnus919/agent-skills) | `6fef46c8402815aedc0c6f5d30fc43f9c31ad95e` | MIT | Target architecture |
| `software-architecture-analysis` | magnus919 | same | MIT | Brownfield analysis |
| `api-design-and-evolution` | magnus919 | same | MIT | API/contracts |
| `adr-authoring` | magnus919 | same | MIT | ADRs (or use local `templates/adr.md`) |
| `writing-technical-design` | [mazrean/agent-skills](https://github.com/mazrean/agent-skills) | `cae3ffde9eb945c9f2e99631bd8a748887e7f8ea` | MIT | Deep tech design |
| `software-architecture-partner` | [edhahn/agent-skills](https://github.com/edhahn/agent-skills) `software-architecture` | `ffc6fc4bf1408bc3cac522916bb58e603f39ab45` | MIT | Often renamed to avoid clash |

When installing any of the above, keep upstream license files and update [THIRD_PARTY_NOTICES.md](../../THIRD_PARTY_NOTICES.md).

## Skipped on purpose

| Source | Reason |
|--------|--------|
| mblode `codebase-architecture` | TS/Next-centric |
| magnus `programming-principles` (book refs) | License/bulk risk |
| Other magnus specialists | Keep default set small |
| BMAD-METHOD | Competing full SDLC |
| lingzhi227 `algorithm-design` | Different purpose (paper/LaTeX); do not confuse with this repo’s companion |

## Companion repo

- `product-manager` (+ its companions) from product-design-skills — optional upstream for confirmed PRDs
- Optional planner packs (e.g. Superpowers): host-dependent
