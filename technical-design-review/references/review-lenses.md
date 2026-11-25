# Review lenses (progressive)

Apply only the lenses relevant to the design under review.

## Problem fit

- Solution anchored to a stated mechanism that may not be the root cause
- Success criteria missing or unmeasurable
- Non-goals absent, so scope can expand silently

## Structure and contracts

- Two modules own the same state
- Orphan responsibilities with no owner
- Interfaces described in prose only where code-level contracts are needed
- Null vs absent, ordering, idempotency, and error codes unspecified

## Algorithms and rules

- Critical branch left as "handle appropriately"
- Soft constraints treated as hard (or the reverse)
- Rule conflicts without priority
- Worked examples missing; only aspirational narrative

## State, concurrency, failure

- Retry that double-applies mutations
- Partial failure leaves illegal state
- Cache invalidation or dual-write without reconciliation story
- Timeouts without deadline propagation

## Compatibility and evolution

- Breaking schema/API change without consumer assessment
- Migration without rollback
- "Additive-only" claimed without consumer decoder analysis

## Performance and cost

- Complexity ignores realistic N
- Hidden chatty remote calls in a hot path
- LLM called in a loop without batching/caching/budget

## Over-design

- Extra services/layers without a second caller or forced constraint
- Premature microservices / event bus / CQRS
- Abstraction that obscures the single concrete implementation

## Testability

- No invariant a test could catch
- Acceptance checks that only validate document existence
- Critical paths covered only by manual "looks right" review
