# Repository Familiarization

## 1. What is this project?

`tidymark` is a small, standard-library-only Python CLI that modifies Markdown files in place. It currently:

- Removes trailing whitespace.
- Converts `* ` and `+ ` list markers to `- `.
- Contains heading-normalization code and a `--headings` flag, although that feature is explicitly parked.

The project emphasizes keeping its working state and decisions documented inside the repository.

## 2. SINGLE most valuable next action

Fix `normalize_bullets` so it replaces bullet markers only at the start of lines, then add a regression test proving that inline emphasis such as `an *important* note` remains unchanged.

Why: the current global `str.replace` can corrupt ordinary prose. This is a shipped defect in otherwise completed functionality, and `STATE.md` explicitly designates it as the sole next action and highest priority.

After completing and testing the fix, the developer should update `STATE.md` as required by the repository workflow.

## 3. Contributor constraints

- Support Python 3.8 or newer.
- Use only the Python standard library; do not add third-party dependencies or a Markdown parser.
- Treat `STATE.md` as authoritative about priorities.
- Do not work on `fix_headings`, its fenced-code TODO, or further heading exposure yet.
- Heading work remains parked until `base_level` has a documented configuration design.
- Run the CLI with `python tidymark.py FILE`.
- Run tests with `python -m pytest`.
- Continue using the repository’s documented workflow: read `START_HERE.md`, then `STATE.md`, perform its one next action, and update the state afterward.
- Note the current inconsistency without guessing how to resolve it: `README.md` advertises `--headings`, and the CLI exposes it, while `STATE.md` says heading support is parked and must not be exposed further.

No tests were executed because the task required strictly read-only work.

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

**99/100**

The next action is stated explicitly in the repository’s designated source of truth. The remaining uncertainty is only that the project owner’s undocumented current intent could differ from the checked-in state.
