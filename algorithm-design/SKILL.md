---
name: algorithm-design
description: >-
  Designs algorithm-intensive features with problem modeling, objectives, constraints,
  candidate algorithms, scoring, pseudocode, conflict resolution, complexity, edge cases,
  and verification. Use when engineering-design routes here, or when the user explicitly
  asks for algorithm design covering search, ranking, matching, scheduling, optimization,
  timeline mapping, multi-stage decisions, complex business rules, or hybrid LLM-plus-
  deterministic pipelines. Prefer engineering-design as the unified entry.
disable-model-invocation: true
---

# Algorithm Design

Specialize in **algorithm-intensive** design that a developer can implement without inventing critical logic during coding.

> Prefer unified entry `engineering-design`. This skill is loaded on demand.

## When to use

- Search / retrieval / similarity matching
- Ranking, scoring, filtering, recommendation, allocation
- Scheduling and optimization
- Timeline / interval mapping
- Multi-stage decision pipelines
- Complex business rules with priorities and conflicts
- Hybrid LLM + deterministic decision systems

## When not to use

- Pure CRUD / UI / glue without non-trivial decision logic
- Greenfield system topology (use `software-architecture`)
- API contract wording alone (use `api-design-and-evolution`)
- Independent design review (use `technical-design-review`)

## Operating rules

1. Adapt to the **current project's** stack, data, and constraints. Do not assume a prior project's algorithms.
2. Prefer reusing existing modules when evidence shows they already solve part of the problem.
3. Separate **facts** (from code/docs), **inferences**, and **open questions**.
4. For every critical path, produce at least one **worked example** and one **counter-example / edge case**.
5. Do not leave scoring weights, rule priority, or failure fallback as "TBD for coding".
6. If an LLM is in the loop, always define output constraints, invalid-output handling, and a deterministic fallback.

## Workflow

Copy and track:

```text
Algorithm design progress:
- [ ] Problem model and optimization objectives
- [ ] I/O, pre/postconditions, invariants
- [ ] Hard vs soft constraints
- [ ] Candidate algorithms + tradeoffs + recommendation
- [ ] Scoring / parameters with rationale
- [ ] Flow + pseudocode
- [ ] Rule priority and conflict resolution
- [ ] Worked examples + edge cases + counterexamples
- [ ] Complexity and resource profile
- [ ] Failure / retry / degrade / rollback
- [ ] Determinism / stability / reproducibility
- [ ] Quality metrics and test strategy
```

### 1. Problem modeling

State: inputs, outputs, decision variables, objective(s), feasibility region, and what "better" means when objectives conflict.

### 2. Constraints

Classify **hard** (must never violate) vs **soft** (penalties / preferences). Name owners of each constraint (product rule, physical limit, compatibility, performance budget).

### 3. Candidates and decision

Propose 2–3 viable algorithms or strategies. Compare correctness risk, complexity, latency/memory, implementability, operability, and fit with existing code. Recommend one; record why others were rejected.

### 4. Detailed design

Produce:

- End-to-end flow (Mermaid when helpful)
- Pseudocode for the core loop
- Data structures and key invariants
- Scoring model and parameter rationale (including defaults and tuning knobs)
- Rule priority table and conflict resolution
- Boundary conditions and undefined-behavior bans

### 5. LLM-hybrid extras (when applicable)

- Structured output schema / allowed action set
- Validation and repair policy for illegal outputs
- Hallucination / overconfidence handling
- Cost, latency, and idempotent retry limits
- Deterministic fallback when the model is unavailable or invalid

### 6. Verification

Define metrics, fixtures, adversarial cases, and regression checks that would catch a wrong algorithm—not only happy-path unit tests.

## Outputs

Use [templates/algorithm-design.md](templates/algorithm-design.md).  
For checklists and anti-patterns, read [references/design-checklist.md](references/design-checklist.md) only when needed.

## Quality bar

Stop only when a competent engineer can implement the core algorithm from the doc alone, without inventing unresolved decision rules, scoring, or failure behavior.
