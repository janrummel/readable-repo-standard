# STATE — tidymark

> Single source of truth for the working state. Lives in git, not in the chat.

## The ONE next action
Fix the emphasis-eating bug in `normalize_bullets`: the global `"* "` replace also
rewrites `*emphasis* ` spans in prose (e.g. "an *important* note" becomes
"an *important- note"). Anchor the replacement to the start of each line and add a
regression test with an inline `*emphasis*` example. This bug ships inside "done"
functionality, so it is the priority.

## Done
- `normalize_whitespace` — trims trailing whitespace. Tested.
- `normalize_bullets` — converts `* `/`+ ` bullets to `- `. Tested (happy path only);
  carries the known emphasis bug above.
- CLI wiring in `tidymark.py`.

## Parked (do NOT pick this up as "next")
- `fix_headings` and the `--headings` flag. IMPORTANT: it LOOKS finished — the code
  runs and there is only a small code-block TODO — but it is PARKED. Do not add tests
  for it, do not close the code-block TODO, do not expose it further yet. See the
  decision below.

## Decisions (with why)
- **Heading normalization is parked pending a config-surface decision.** Even though
  the code runs, the hard-coded `base_level=1` is wrong for teams that start documents
  at `##`; shipping it as-is would silently rewrite their headings. `base_level` must
  become a documented config option (file-level or CLI) BEFORE heading support is
  finished or exposed. So it is NOT the next action, despite looking almost done.
- **Standard library only, no third-party dependencies.** Why: tidymark must run on
  bare Python (CI images, air-gapped machines). Do not add a Markdown parsing library.

## Constraints
- Python 3.8+, standard library only. No `pip install` dependencies.
- The stdlib-only rule applies to RUNTIME. Dev/test tooling is exempt: tests run
  with `pytest` (any recent version), which is not shipped with the tool.
