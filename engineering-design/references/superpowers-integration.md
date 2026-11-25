# Optional planner integration (e.g. Superpowers)

## Detection

[Superpowers](https://github.com/obra/superpowers) (and similar planner / TDD / review skill packs) may be available on some hosts as a plugin or sibling skills. They are **not** required for `engineering-design`.

If brainstorming / writing-plans / TDD skills are discoverable in the session, treat them as available. If not, proceed with this orchestrator alone.

Do not assume a Cursor-only install path; resolve whatever skills the current host has loaded.

## Target collaboration (when available)

```text
User goal
  → engineering-design (mode + level + routing)
  → optional brainstorming (only if intent still fuzzy)
  → specialist design skills as routed
  → design artifacts + L2/L3 review
  → user confirms design
  → optional writing-plans
  → (only if user wants) implementation / TDD / review skills
```

## Rules

1. **Do not** re-run brainstorming if requirements are already clear.
2. **Do not** patch plugin source to force hooks.
3. **Do not** introduce a second full SDLC framework alongside an optional planner pack.
4. User confirmation of *requirements* ≠ confirmation of *technical design*.
5. L2/L3: finish design + review gates **before** `writing-plans`.
6. Design-only requests: stop before implementation skills.
7. Planning must not invent new critical architecture; bounce back to design instead.
8. If the planner’s order differs, adapt without skipping its necessary user confirmations when you choose to use it.

## Without optional planners

`engineering-design` still owns:

- Intent clarification (lightweight)
- Architecture / technical / algorithm design
- Design review
- A concise implementation outline if the user asks for one (not a substitute for project-specific planning skills)
