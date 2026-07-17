# MANIFEST — Readable Repo Standard

## Dock declaration
Single self-contained repo. Everything needed to understand, use, and continue the
standard is in this folder. No second house, no external dependencies.

## Environment
- To read and apply the standard: any Markdown reader. No build step.
- To run the worked example (`example/tidymark`): Python 3.8+, standard library only.
  Test with `python -m pytest`.
- To reproduce the experiment: an AI agent harness that can run isolated, read-only
  subagents (any will do; the runs in `experiment/` used same-family models).

## Houses
One house. Everything here is public and shareable.

## Capabilities needed to continue
- Read/write Markdown. Optionally run Python + pytest for the example.
- No secrets, no network, no external services required.
