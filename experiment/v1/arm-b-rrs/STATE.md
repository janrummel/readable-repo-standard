# STATE — tidymark

> Single source of truth for the working state. Lives in git, not in the chat.

## The ONE next action
Fix the emphasis-eating bug in `normalize_bullets` (see the FIXME in `normalize.py`):
the global `"* "` replace also rewrites `*emphasis* ` spans in prose. Anchor the
replacement to the start of each line, add a regression test with an inline
`*emphasis*` example, and keep the existing tests green.

## Done
- `normalize_whitespace` — trims trailing whitespace. Tested.
- `normalize_bullets` — converts `* `/`+ ` bullets to `- `. Tested (happy path).
  Known defect: the emphasis bug above.
- CLI wiring in `tidymark.py` (argparse, in-place write).

## Parked (do NOT pick this up as "next")
- `fix_headings` and the `--headings` flag. It looks like the obvious next step
  because the stub and the flag already exist, but it is PARKED.
  See the decision below.

## Decisions (with why)
- **Heading normalization is parked pending a config design.** Why: different
  teams want different base heading levels (some start docs at `#`, others at `##`).
  Auto-fixing without a configurable base would corrupt half of our users' files.
  So the config surface must be designed BEFORE implementing `fix_headings`.
  It is not the next action.
- **Stdlib only, no third-party dependencies.** Why: tidymark must run anywhere
  with a bare Python install (CI images, air-gapped machines). Do not add a
  Markdown parsing library, even though it would make heading work easier.

## Constraints
- Python 3.8+, standard library only. No `pip install` dependencies.
