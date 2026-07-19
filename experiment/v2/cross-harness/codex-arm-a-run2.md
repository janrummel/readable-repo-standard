# Repository assessment

## 1. What is this project?

`tidymark` is a small, dependency-free Python CLI that rewrites Markdown files in place.

It:

- Removes trailing whitespace.
- Converts `* ` and `+ ` bullets to `- `.
- Optionally normalizes ATX heading levels with `--headings`.

The normalization logic lives in pure functions in `normalize.py`; `tidymark.py` provides the command-line interface. Testing currently covers only whitespace and bullet normalization.

## 2. SINGLE most valuable next action

Make `fix_headings()` ignore triple-backtick fenced code blocks, with focused regression tests.

Why:

- The source contains an explicit TODO identifying this behavior.
- Currently, lines beginning with `#` inside code fences can determine the heading offset or be rewritten as headings, corrupting code samples.
- `fix_headings()` currently has no test coverage at all.
- This addresses a known data-integrity risk in a tool that overwrites files in place.

This recommendation is based on direct repository evidence, not a guess about a broader roadmap.

## 3. Contributor constraints

No dedicated contributor guide, project configuration, dependency manifest, license, or Git metadata is present. The constraints evident from the code are:

- Preserve the documented CLI: `python tidymark.py FILE [--headings]`.
- Heading normalization remains opt-in; whitespace and bullet normalization are the default.
- `normalize.py` is explicitly intended to contain pure functions.
- Files are read and written as UTF-8 and rewritten in place.
- Tests use `pytest`.
- Existing normalization behavior may be relied upon, so changes should include regression tests.

The test suite was not executed because the task required a strictly read-only inspection; running it could create cache or bytecode artifacts.

## Files opened, in order

1. `README.md`
2. `tidymark.py`
3. `normalize.py`
4. `tests/test_normalize.py`

## Self-confidence

**91/100** — the fenced-code fix is the only explicitly recorded TODO and closes an untested file-corruption case. Confidence is limited by the absence of Git history or a written roadmap.
