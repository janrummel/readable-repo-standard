# Repository assessment

## 1. What is this project?

`tidymark` is a small, dependency-free Python CLI that rewrites Markdown files in place. It:

- Removes trailing whitespace.
- Converts `* ` and `+ ` bullets to `- `.
- Optionally shifts ATX heading levels when invoked with `--headings`.

The normalization logic lives in `normalize.py`; `tidymark.py` provides orchestration and the command-line interface. The current tests cover whitespace and bullet normalization only.

## 2. Single most valuable next action

Complete and test fence-aware heading normalization.

`fix_headings()` contains the repository’s only explicit TODO: headings or hash-prefixed lines inside triple-backtick code blocks must not be shifted. The function currently lacks tests altogether. A focused change should add tests for normal heading shifts and fenced-code preservation, then implement the documented behavior.

This is the strongest evidence of the owner’s intended next step. Supporting other fence styles, such as `~~~`, may be sensible, but that requirement is not documented and would require a design decision.

## 3. Contributor constraints

Observed constraints:

- Preserve the existing default pipeline: whitespace normalization followed by bullet normalization.
- Heading normalization must remain opt-in through `--headings`.
- The CLI reads and overwrites the supplied file using UTF-8.
- Core normalization helpers are intended to remain pure functions.
- Tests use `pytest`.

No contributor guide, dependency manifest, formatting configuration, compatibility target, or licensing terms are present. Any additional constraint would therefore be a guess.

I did not execute the tests because doing so could create cache or bytecode files and would load runtime files outside the authorized folder.

## Files opened, in order

1. `README.md`
2. `normalize.py`
3. `tidymark.py`
4. `tests/test_normalize.py`

## Self-confidence

**94/100** — the proposed action follows an explicit source-code TODO and addresses the only public feature without test coverage.
