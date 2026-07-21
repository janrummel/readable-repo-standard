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
- Adversarial expert-role review of the public surfaces (2026-07-21, four lenses:
  experiment methodologist, standards editor, skeptical adopter + security, technical
  editor). First remediation block applied, all six verifiable errors:
  - The link-preview image still showed the v2 Claude-only figures (0/3, 3/3) while every
    text surface said 0/5, 5/5. Re-rendered, and it now has a source: `assets/og-image.html`
    plus a branch in `assets/render.sh`, so both public images are reproducible.
  - `STANDARD.md` claimed the `AGENTS.md` bridge was validated by a foreign model. The
    repo's own raw runs contradict it: `codex-arm-b-run1.md` lists `AGENTS.md` as the ninth
    and last file opened. The claim is now stated as untested, with a pointer to the runs.
  - "one-line" vs "three-line" bridge (both wrong, the file has nine lines) replaced with
    "a short bridge" on all surfaces.
  - The landing page described the treatment arm as four files; it carries five, the bridge
    included. Corrected there and in the "try it yourself" step.
  - `RESULTS-v2.md` labelled a range as a median and its RRS range excluded B-1's 97. Now
    "median (range)": 88 (82-94) vs 98 (97-99), which is where the public 88/98 come from.
  - The root `MANIFEST.md` still carried the stdlib-vs-pytest ambiguity that was fixed in
    `example/tidymark` after the cross-harness run found it.
  - The diagram's cycle label used an em-dash; removed, images re-rendered, alt text now
    also names the four files it shows.
  Known and NOT yet addressed, see Parked: the claim wording ("empirically validated"),
  the missing limits on the public surfaces, and the trap-priming sentence in Arm B.
- Docking diagram added to the two public surfaces (2026-07-21): README shows it directly
  under the pitch (before "The idea in one screen"), the landing page shows it in the hero
  under the byline. It is the visual form of the core claim (the pen is interchangeable,
  the book carries the knowledge), so it sits before the detail, not after it. The landing
  page carries the SVG inline on its own design tokens (theme-aware, scrolls instead of
  shrinking on narrow screens); the README uses a light/dark `<picture>` pair.
  Reproducible: source `assets/docking-diagram.html`, render `./assets/render.sh`
  (headless Chrome, 2x) into `assets/docking-diagram-{light,dark}.png`. The inline SVG in
  `docs/index.html` and the render source are duplicates on purpose (no build step);
  change both together.
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
Open findings from the 2026-07-21 expert-role review. Parked, not dismissed: each one is
a decision waiting to be made, and the honest ones cost credibility every day they stay.

- **Claim wording.** "empirically validated" (`README.md`, `STANDARD.md`) overstates n=5 on
  one synthetic project with one trap, graded unblinded by the author. Target wording:
  "tested rather than proven".
- **Limits belong on the public surfaces.** The real bounds (one synthetic project, small n,
  self-reported confidence, no Arm C, author-graded) live in `experiment/README.md`; the
  landing page's "Honest boundaries" chips list wins instead.
- **Arm B carries a trap-priming sentence.** `experiment/v2/arm-b-rrs/START_HERE.md` warns
  that parked code can look finished. It is not in `templates/` and not in v1, and it speaks
  to the graded "trap avoided" metric. Disclose it in the honesty log; remove it and re-run
  Arm B before the metric is quoted again.
- **The constraint metric was tightened after the fact.** The pre-registered wording was
  "names stdlib-only"; both bare Codex runs wrote "dependency-free" in their first sentence.
  Under the literal rule that metric is 2/5, not 0/5. Report both readings.
- **"Raw runs" is promised for all ten runs; only the four Codex runs have transcripts.**
  Either commit the six Claude transcripts or narrow the wording.
- **No Arm C** (unstructured `NOTES.md` carrying the same facts). Without it the experiment
  supports "write the state down" more strongly than it supports this specific file layout.
- **What must never enter the repo.** The standard tells people to write decisions into git
  and never says what must stay out (credentials, personal data, NDA content, customer and
  pricing detail). Git history survives deletion, forking and mirroring, and any docking
  agent may ship the folder to a third-party model. Needs its own section.
- **Conformance is defined three ways** (an iff over five questions in §0, the appendix
  checklist, one question in the README) and there is no MUST/SHOULD/MAY vocabulary, so no
  statement in the document is objectively binding.
- **Quick start overwrites an existing `AGENTS.md`.** Needs a merge rule, not a copy rule.
- **This repo has never run its own litmus test** (§6 requires a result in `tests/`), while
  the README calls it "its own first example".
- **Absolutes** ("any blank AI model", "no memory to lose", "just knows what to do next")
  are falsifiable by one counterexample and contradict `companion/README.md`'s own
  "one real failure mode: discipline".
- **Version tag, CHANGELOG, and what v0.x means**; plus a licence split (spec text vs code)
  and a trademark notice for the model names used in the diagram.

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
