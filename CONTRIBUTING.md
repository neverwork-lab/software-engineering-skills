# Contributing

Thanks for contributing to **software-engineering-skills**.

## Principles

- Keep the toolkit **domain- and stack-agnostic**.
- Prefer portable [Agent Skills](https://agentskills.io/) layout (`SKILL.md` + optional `references/` / `templates/`).
- Do not bake project-specific business knowledge into global skills.
- Prefer evidence-based design guidance over process overhead.

## How to contribute

1. Fork and create a branch.
2. Make focused edits; update docs (`README.md` / `README_zh.md`) when behavior or install steps change.
3. If you add or vendor a third-party skill, update `THIRD_PARTY_NOTICES.md` and `engineering-design/references/installed-sources.md`, and keep upstream license files.
4. Open a pull request describing **why** the change helps engineering design quality.

## Skill authoring notes

- `name` and `description` in `SKILL.md` frontmatter must stay accurate for auto-discovery.
- Keep `SKILL.md` operational; put long methods in `references/`.
- Templates should be testable and free of proprietary product content.
- Design-only paths must remain valid: do not force implementation.

## License

By contributing, you agree that your contributions are licensed under the MIT License ([LICENSE](LICENSE)).
