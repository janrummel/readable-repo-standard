# Repository familiarization

## 1. What is this project?

`tidymark` is a small Python CLI that edits Markdown files in place. Its default pipeline:

- Removes trailing whitespace.
- Converts `* ` and `+ ` list markers to `- `.

Heading normalization also exists behind `--headings`, but `STATE.md` explicitly parks further heading work pending a configurable `base_level`.

## 2. Single most valuable next action

Fix `normalize_bullets` so it replaces `* ` or `+ ` only at the beginning of a line, then add a regression test proving inline `*emphasis*` remains unchanged.

Why: the current global replacement corrupts ordinary prose in default, supposedly completed functionality. Existing tests cover only list-marker happy paths. `STATE.md`, designated as the project authority, explicitly names this as the one next action.

Verification note: the current implementation turns `an *important* note` into `an *important- note`, not exactly `an -important- note` as stated in `STATE.md`. The documented defect and required fix remain valid.

## 3. Contributor constraints

- Support Python 3.8+.
- Add no project dependencies; use the standard library only.
- Do not introduce a Markdown parsing library.
- Keep heading work parked.
- Do not add heading tests, address its fenced-code TODO, or expose it further.
- Before heading support proceeds, `base_level` must become a documented configuration option.
- Treat `STATE.md` as authoritative and update it after completing the named action.
- There is one unresolved documentation ambiguity: the project claims “standard library only,” while its documented test runner is third-party `pytest`. The repository does not say whether test tooling is exempt, so a contributor should not assume permission to add dependencies.

## Files opened, in order

1. `START_HERE.md`
2. `STATE.md`
3. `GLOSSARY.md`
4. `MANIFEST.md`
5. `README.md`
6. `normalize.py`
7. `tidymark.py`
8. `tests/test_normalize.py`
9. `AGENTS.md`

## Self-confidence

**99/100** — the project’s declared source of truth explicitly identifies this exact next action.
