# Technical Design — {{title}}

- Level: L2
- Date: YYYY-MM-DD
- Status: draft | review | approved
- Related: …

## TL;DR

[2–3 sentences: approach + key tradeoff]

## 1. Problem & goals

- Business / user goal:
- Real problem (not just requested mechanism):
- Non-goals:
- Success criteria:
- Facts / inferences / open questions:

## 2. Current system (evidence)

- Relevant components:
- Data / control flow today:
- Root cause or gap:
- Reuse opportunities:

## 3. Options

| Option | Summary | Pros | Cons | Risk |
|--------|---------|------|------|------|
| A | | | | |
| B | | | | |

**Decision:** …  
**ADR:** link or N/A

## 4. Design

### Boundaries & responsibilities

| Module | Responsibility | Owns data | Depends on |

### Flows

```mermaid
sequenceDiagram
  …
```

### Interfaces & data contracts

(code-shaped where possible)

### Algorithms / rules (or link to algorithm design)

### State & lifecycle

### Failure, retry, degrade, recovery

### Performance / concurrency / caching / consistency

### Compatibility / migration / rollback

### Security / privacy (as relevant)

### Observability

## 5. Test & acceptance

- Critical invariants:
- Cases that must fail if design is wrong:

## 6. Review gate

- Review doc:
- Gate: pass | revise | block
