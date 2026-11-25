# Design quality gates

## L0

- [ ] Change understood; risk truly local
- [ ] No silent contract/algorithm/data migration impact
- Stop: no mandatory design document

## L1 — before coding

- [ ] Problem and non-goals clear
- [ ] Touch points in existing code identified (or N/A for greenfield)
- [ ] Approach chosen; major alternatives noted if non-obvious
- [ ] Data/API impact stated if any
- [ ] Test/acceptance ideas listed
- Fail → return to lightweight design

## L2 — before implementation planning

- [ ] Existing system / root cause understood with evidence
- [ ] Important technical decisions have rationale
- [ ] Core module responsibilities and interfaces are explicit
- [ ] Critical algorithms/rules are implementable as written
- [ ] Rule conflicts have resolution
- [ ] Edge cases and failure/degrade paths defined
- [ ] Performance/resource risks analyzed where relevant
- [ ] Tests can falsify critical design claims
- [ ] No critical decision deferred to "figure out while coding"
- [ ] Review gate is **pass** (no open P0; P1 handled) — independent specialist if installed, else labeled self-review
- Fail → return to the incomplete stage (not to coding)

## L3 — before implementation planning

All L2 gates, plus:

- [ ] Architecture characteristics/scenarios prioritized
- [ ] Candidate architectures compared; recommendation recorded
- [ ] Boundaries, ownership, and coupling justified
- [ ] Runtime failure/consistency behavior explicit for distributed paths
- [ ] Migration / coexistence / rollback considered
- [ ] ADRs written for irreversible or portfolio-level choices
- [ ] Review gate **pass** with architecture-scale scrutiny
- Fail → return to architecture/design; do not plan implementation

## Anti-gaming

- More pages ≠ better design
- "Considered" without mechanism ≠ handled
- Template sections filled with placeholders ≠ complete
