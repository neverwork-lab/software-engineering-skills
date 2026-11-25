# Third-party notices

This repository’s original content (orchestrator skill, templates, documentation)
is licensed under the MIT License — see [LICENSE](LICENSE).

## Status

This release ships first-party skills: `engineering-design`, `algorithm-design`,
and `technical-design-review` (all MIT, this repo).

It does **not** vendor third-party skill trees (magnus919 / mazrean / edhahn / …).
Optional third-party names in `engineering-design/references/installed-sources.md`
must be installed separately.

Upstream candidates listed in the README (for example magnus919/agent-skills,
mazrean/agent-skills, edhahn/agent-skills, obra/superpowers) remain optional
dependencies. If you install them separately, you must comply with **their**
licenses and preserve their copyright notices.

## When vendoring third-party skills

If this project later copies or submodules third-party skills:

1. Record each package in `engineering-design/references/installed-sources.md`
   (repo, commit/tag, license).
2. Keep each upstream `LICENSE` / copyright file next to the vendored skill
   (or link clearly from this document).
3. Do not relicense third-party code as MIT unless the upstream license allows
   and attribution requirements are still met.

## Intentionally not included

Full competing SDLC frameworks and strongly stack-biased packs may be skipped
even when MIT-licensed, to keep this toolkit focused. See
`engineering-design/references/installed-sources.md` for skipped sources and reasons.
