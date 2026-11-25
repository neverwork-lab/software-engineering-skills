# engineering-design

Portable [Agent Skills](https://agentskills.io/) orchestrator for software engineering **design**. Cross-project, cross-stack, and host-agnostic (Claude Code, Codex, Cursor, OpenClaw, and other Agent Skills clients).

**Ships alone.** Optional specialists in the registry are not part of this folder; see `references/standalone-operation.md`.

## Install location

Install this folder under your agent’s skills root, for example:

```text
~/.agents/skills/engineering-design/     # Codex / portable default
~/.claude/skills/engineering-design/     # Claude Code
~/.cursor/skills/engineering-design/     # Cursor
~/.openclaw/workspace/skills/engineering-design/  # OpenClaw
```

Specialists live as **siblings** under the same skills root (not nested inside this folder). See the repo root README for the full host table.

## How to use

Invoke via slash command where supported, or ask the agent to load this skill:

```text
/engineering-design Design a plugin system
/engineering-design Optimize the core algorithm
/engineering-design Review this technical design
```

OpenClaw-style: `/skill engineering-design`. The orchestrator classifies mode + L0–L3, loads only needed specialists, and stops at design unless you ask to implement.

## Layout

```text
engineering-design/
  SKILL.md
  README.md
  references/
    skill-registry.md
    routing-matrix.md
    quality-gates.md
    superpowers-integration.md
    installed-sources.md
  templates/
    lightweight-design.md
    technical-design.md
    architecture-design.md
    adr.md
    design-review.md
```

## Related specialists (siblings)

- `software-architecture`, `software-architecture-analysis`
- `software-architecture-partner`
- `writing-technical-design`
- `api-design-and-evolution`, `adr-authoring`
- `algorithm-design`, `technical-design-review`

## Optional planners (e.g. Superpowers)

Optional. If brainstorming / writing-plans (or similar) skills are discoverable on the current host, collaborate per `references/superpowers-integration.md`. Design still works without them.

## Maintenance

1. Update third-party skills by re-copying from upstream at a pinned commit; refresh `PROVENANCE.md` and `references/installed-sources.md`.
2. Prefer one checkout; copy or symlink into each host’s skills root you use.
3. Do not put project business knowledge into these global skills.
4. After installing or updating, start a new agent session and confirm the skill is discoverable.

## Uninstall

Delete the skill folders listed in `references/installed-sources.md` from each skills root you installed into. Does not affect optional planner plugins or project-local skills.
