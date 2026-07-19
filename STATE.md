# STATE — Readable Repo Standard

> Single source of truth for this repo's working state. Lives in git, not in the chat.
> Status lives ONLY here; other files do not declare their own completeness.

## The ONE next action
v0.3 direction: the optional companion layer (see `companion/README.md`) — a
deterministic conformance linter first, then a generative tracking-proposer that
suggests STATE.md entries at the moment state is created. Kept OUTSIDE the core.
No deadline; tester feedback from the published repo may reprioritize this.

## Next
- Watch for issues/feedback on the published repo (tester CTA in README).

## Done
- Public claim surfaces updated to the combined cross-harness evidence (2026-07-19):
  README scoreboard + status section, STANDARD.md status line, experiment/README
  (new replication section, limitation closed), landing page (meta descriptions,
  5-dot scoreboard, confidence meter 88, integrity chip). Combined figures: bare 0/5
  vs RRS 5/5, confidence medians 88 vs 98. A LinkedIn follow-up comment under the
  launch post was drafted for the owner to publish by hand.
- **Cross-harness replication (2026-07-19): bare 0/2 vs RRS 2/2 with GPT-5.4 via the
  OpenAI Codex app** (fresh session per run, read-only, executed by the owner by hand;
  disposable arm copies with neutral names, ground truth kept outside the folder tree).
  Combined with the Claude v2 runs: bare 0/5 vs RRS 5/5 on all three pre-registered
  metrics; the Codex bare runs were MORE confidently wrong (91-94) than Claude's (82-88).
  Bonus finding: the foreign model audited the treatment files and surfaced two real
  documentation defects (STATE's corruption example was slightly off; pytest vs
  stdlib-only ambiguity). Both fixed in `example/tidymark`; the frozen arm copies in
  `experiment/v2/arm-*` are deliberately untouched as run evidence. Raw runs, prompt,
  and grading: `experiment/v2/cross-harness/` + RESULTS-v2 "Cross-harness replication".
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
- Published: public repo at github.com/janrummel/readable-repo-standard, GitHub Pages live
  at janrummel.github.io/readable-repo-standard (served from `main` /docs).
- Presence pass (github-presence / website-review, target Framework Gold): README voice
  neutralized (public repos use a neutral voice; the LinkedIn post stays first-person on
  purpose), added `LICENSE` (MIT), a Quick Start with `git clone`, a "How this repo is
  organized" + core-vs-companion section, OG/meta tags in `docs/`, and removed em-dashes.
  FAQ / Contributing / landing-design criteria deliberately deferred (premature; landing
  design is intentionally untouched).
- Expert-role audit (4 lenses: maintainer, technical writer, skeptical adopter, launch
  strategist) run against the live state; Tier-1 remediation applied:
  - Discoverability: repo homepage set to the Pages URL, 10 topics added, README nav line
    linking Landing/Standard/Templates/Experiment, landing page now links back to the repo.
  - Link previews: 1200x630 `docs/og-image.png` + og:image / twitter summary_large_image.
  - Self-consistency (the standard was violating its own rules): §3 STATE sections clarified
    (canonical menu + which are required), START_HERE mandatory sections (confidentiality +
    reach) added to this repo's and tidymark's START_HERE, tidymark MANIFEST gained the §8
    code-repo block, four-vs-five file count reconciled + `.template` rename note, and the
    orphan 45/65 figures in STANDARD replaced with the experiment's own numbers.
  - Launch: LinkedIn post reworked (hook front-loaded, link moved to the first comment, CTA
    tightened). Deferred to Tier 2/3: version tag + CHANGELOG, interop with existing
    AGENTS.md/CLAUDE.md, committing raw transcripts, and the Arm-C (unstructured NOTES.md)
    control that would close the "true by construction" critique.

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
