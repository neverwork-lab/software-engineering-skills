# Algorithm design checklist

Use as a gate before marking algorithm design complete.

## Completeness

- [ ] Problem is modeled as decisions + objectives, not as vague "make it smarter"
- [ ] Hard vs soft constraints are separated
- [ ] At least two real candidates were considered when the choice is non-obvious
- [ ] Recommendation cites project constraints / evidence
- [ ] Pseudocode covers the main path and major branches
- [ ] Conflict resolution is explicit (priority table or total order)
- [ ] At least one typical worked example
- [ ] At least one edge case / counterexample
- [ ] Complexity stated relative to realistic input sizes
- [ ] Failure + fallback defined for each critical dependency
- [ ] Determinism / stability expectations stated
- [ ] Tests can falsify an incorrect implementation

## LLM-hybrid extras

- [ ] Output schema / allow-list defined
- [ ] Invalid output path defined (reject / repair / fallback)
- [ ] Cost and latency budgets
- [ ] Retry idempotency and max attempts
- [ ] Deterministic fallback without the model

## Anti-patterns

- Scoring weights with no rationale ("tune later")
- "Use an LLM to decide" with no validation or fallback
- Hiding O(n²) behind "should be fine"
- Rules that can both fire with opposite actions and no priority
- Examples that only show the happy path
- Claiming optimality without stating the objective and search space
