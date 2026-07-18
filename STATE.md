# STATE — Readable Repo Standard

> Single source of truth for this repo's working state. Lives in git, not in the chat.
> Status lives ONLY here; other files do not declare their own completeness.

## The ONE next action
Push to GitHub: `gh repo create janrummel/readable-repo-standard --public --source=. --push`.
Once live, the repo URL in the LinkedIn post (github.com/janrummel/readable-repo-standard)
resolves. (Owner runs the push.)

## Next
- A true cross-harness litmus run: a different model family / different CLI on
  `example/tidymark`, to strengthen the model-agnosticism claim beyond same-family runs.
- v0.3 direction: the optional companion layer (see `companion/README.md`) — a
  deterministic conformance linter first, then a generative tracking-proposer that
  suggests STATE.md entries at the moment state is created. Kept OUTSIDE the core.

## Done
- `STANDARD.md` v0.2 written (touchstone, four files + AGENTS bridge, human-vs-model
  docs, snapshot discipline, houses, litmus protocol with per-question scoring, code-repo
  execution layer, exit criterion).
- `README.md` with the pitch, the A/B evidence, and the tester CTA.
- `example/tidymark` — worked example built to the standard.
- `experiment/` — pre-registered A/B, two variants, raw runs, results, honesty log.
  v1: with-code-comment case (confidence 78 -> 98). v2: sharpened case (bare 0/3, RRS 3/3).
- `templates/` — the five copy-paste files.
- This repo made RRS-conformant (its own START_HERE / STATE / MANIFEST / GLOSSARY / AGENTS).
- `git init` + first commit done (snapshot 1). Companion v0.3 note added (`companion/`).
- Confidence figures corrected to self-reported median (Arm A = 82, raw 88/82/82) across
  README, experiment/README, RESULTS-v2, and the shareable visualization, after a Quality-Gate.
- GitHub Pages landing page added at `docs/index.html` (harness-minimum hero + the A/B scoreboard).
- README intro reframed to the harness-minimum thesis (repo carries the harness minimum;
  the four files are the concrete first step). Standard text (STANDARD.md) kept precise.

## Parked (do NOT pick this up as "next")
- None currently.

## Decisions (with why)
- **Named "Readable Repo Standard", not the working codename.** Why: the original
  metaphor used a registered toy trademark; a public project should not carry a brand
  name. The metaphor stays in prose as descriptive use; the project name describes the
  benefit.
- **Standard written in English.** Why: a public standard reaches more testers in
  English; the LinkedIn write-up can be in the author's language.
- **The example is synthetic (`tidymark`).** Why: it doubles as the public worked example
  and the A/B substrate, with zero confidentiality exposure.

## Context
RRS generalizes a privately validated convention ("repo = book, model = pen") into a
public, testable standard. The A/B experiment in `experiment/` is the empirical backbone.
