# MANIFEST — tidymark

## Dock declaration
Single self-contained repo. There is no second "house": everything needed to
understand and continue the project is in this folder.

## Environment
- Python 3.8+ (standard library only; no third-party dependencies by design, see STATE.md).
- Run:  `python tidymark.py FILE`
- Test: `python -m pytest`

## Capabilities needed to continue
- Read/write Python, run pytest.
- No external services, no secrets, no network access required.

## Code repos also declare (STANDARD.md §8)
- Dependency manifest: none needed, standard library only.
- Raw-data provenance: n.a., no data artifacts.
- External-service config: none, no network and no secrets.
- Inter-piece interface: `normalize.py` exposes pure functions
  (`normalize_whitespace`, `normalize_bullets`, `fix_headings`) consumed by
  `tidymark.py`; the contract is those function signatures.
- "Done" here means: code + tests agree and run via `python -m pytest`.
