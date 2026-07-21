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
- **v3 run (2026-07-21): the layout is not what carries the effect, and the hint was not
  load-bearing.** Preregistration committed first (`14ec558`), so this is the first
  prediction in this project timestamped by the repository itself. Two arms on identical
  code, three runs each, blind grading by a separate agent:
  - **B′** (RRS with the trap-priming sentence removed from `START_HERE.md`): **3/3/3**.
    The v2 result therefore stands on the files, not on the hand-written hint. Prediction
    confirmed as written.
  - **C** (bare plus one unstructured `NOTES.md` carrying the same three facts): **3/3/3**,
    confidence within two points of B′. This was the pre-registered "C matches B′" case and
    the consequence was fixed in advance: **the claim narrows.** What the experiment
    supports is *recording the state where the next reader will find it*. It does not
    support "these four files beat a plain note", at least not at this scale.
  - Public surfaces updated accordingly: README (a new paragraph that states the narrowing
    in plain words), landing page (leading boundary chip is now the finding itself),
    `STANDARD.md` status, `experiment/README.md` (v3 section, honesty log reconciled).
    The bare-vs-RRS scoreboard stays; only the implication that the layout did it is gone.
  - Where structure is still expected to pay off is what this test cannot reach: scale,
    a note grown over a year, several sessions, several authors, and merging two notes.
    That is now stated as a bet rather than as a result.
  - All six transcripts committed verbatim in `experiment/v3/runs/`. No run wandered
    outside its folder.
- Honesty pass on the claim surfaces (2026-07-21, second remediation block from the
  expert-role review):
  - "empirically validated" replaced with "tested rather than proven" in `README.md` and
    `STANDARD.md`, each with n, scope, and what the experiment actually manipulates
    (whether state is recorded at all, not whether this file layout is the best one).
  - The real limits now sit on the public surfaces, not only in `experiment/`: a "What this
    does not show" paragraph in the README, and the landing page's boundary chips replaced
    (n=5, one synthetic project, no unstructured-notes control, author-graded and unblinded,
    confidence self-reported).
  - Disclosed that the `constraint_found` metric was read more strictly than its
    pre-registered wording: 2/5 bare literally, 0/5 tightened. Both are now printed in
    `RESULTS-v2.md` and in the honesty log, and the "cannot be tuned after the fact"
    sentence in `experiment/README.md` was corrected.
  - Honesty log extended: the cross-harness runs were not pre-registered, grading was
    unblinded and single-rater, verbatim transcripts exist only for the four Codex runs,
    there is no third arm, and the git history begins after the runs. "raw runs" narrowed
    to "the graded runs" wherever all ten were implied.
  - `STANDARD.md` gained §5a "What must never enter the repo" (credentials, personal data,
    NDA content, customer and pricing detail), with the rule "record the constraint, not
    the confidential fact", a note that committed secrets must be rotated rather than
    patched, and the warning that a docking agent may transmit the folder to a third-party
    model. Mirrored into the START_HERE template and the conformance checklist.
  - `STATE.md` itself cleaned: launch and reach tactics removed (they do not belong in the
    file the standard tells every reader to open first), and the naming decision reworded
    so it no longer records a third-party mark.
  - The `experiment/README.md` reproduce step pointed at a prompt that is not in the
    preregistration; it now points at `v2/cross-harness/PROMPT.txt`, the only recorded one.
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
  The wording and disclosure findings from the same review were closed in the honesty pass
  above, and the two findings about the evidence itself were answered by the v3 run.
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
  vs RRS 5/5, confidence medians 88 vs 98.
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
- Public presence pass: neutral README voice, `LICENSE` (MIT), a Quick Start with
  `git clone`, a "How this repo is organized" + core-vs-companion section, link-preview
  metadata in `docs/`, and em-dashes removed. FAQ and Contributing deliberately deferred
  as premature; the landing design is intentionally untouched.
- Expert-role audit (4 lenses: maintainer, technical writer, skeptical adopter, launch
  strategist) run against the live state; Tier-1 remediation applied:
  - Discoverability: repo homepage points at the Pages URL, README nav line linking
    Landing/Standard/Templates/Experiment, landing page links back to the repo.
  - Link previews: 1200x630 `docs/og-image.png` + og:image / twitter summary_large_image.
  - Self-consistency (the standard was violating its own rules): §3 STATE sections clarified
    (canonical menu + which are required), START_HERE mandatory sections (confidentiality +
    reach) added to this repo's and tidymark's START_HERE, tidymark MANIFEST gained the §8
    code-repo block, four-vs-five file count reconciled + `.template` rename note, and the
    orphan 45/65 figures in STANDARD replaced with the experiment's own numbers.
  - Deferred at the time, now tracked under Parked: version tag + CHANGELOG, interop with
    an existing AGENTS.md/CLAUDE.md, committing raw transcripts, and the Arm-C
    (unstructured NOTES.md) control that would close the "true by construction" critique.

## Parked (do NOT pick this up as "next")
Open findings from the 2026-07-21 expert-role review. Parked, not dismissed. The wording
and disclosure findings were fixed the same day (see Done); what is left needs either a
run or a decision, and each one has a trigger rather than a date.

- **The frozen v2 treatment arm still contains the priming sentence.** It stays as run
  evidence, like the other deliberately untouched arm copies. v3 showed it was not
  load-bearing, so this is bookkeeping, not a correction. Trigger: none, do not "fix" it.
- **Does the layout beat a plain note at scale?** v3 answered the question at 120 lines and
  a 30-line note: it does not. The interesting version of the question needs a bigger
  project, a note grown over months, several authors, or a merge. That is the bet RRS
  makes and it is currently untested. Trigger: a real repo, not a synthetic one.
- **The six Claude runs have no verbatim transcripts.** The wording no longer claims
  otherwise. Committing them (sanitized) would still be strictly better. Trigger: any
  dispute about a graded row.
- **Conformance is defined three ways** (an iff over five questions in §0, the appendix
  checklist, one question in the README) and there is no MUST/SHOULD/MAY vocabulary, so no
  statement in the document is objectively binding. Trigger: the first time someone asks
  "is my repo conformant?".
- **Quick start overwrites an existing `AGENTS.md`.** Needs a merge rule, not a copy rule;
  same for `CLAUDE.md` and similar files. Trigger: the first report of a collision.
- **This repo has never run its own litmus test** (§6 requires a result in `tests/`), while
  the README calls it "its own first example". Trigger: the next substantive change to
  `STANDARD.md`.
- **Absolutes in the pitch** ("any blank AI model", "no memory to lose", "just knows what to
  do next") are falsifiable by one counterexample and contradict `companion/README.md`'s own
  "one real failure mode: discipline". Trigger: the next pass over the pitch text.
- **Standard machinery deliberately not built yet:** conformance linter and a CI snippet,
  version tag, CHANGELOG, a definition of what v0.x means and what v1.0 requires, a licence
  split (spec text vs code) and a trademark notice for the model names in the diagram.
  Reason: none of it has a user yet. Trigger: a second repo, not this one, adopting RRS.

## Decisions (with why)
- **Named for what it does, not for a metaphor.** Why: a public project should not lean
  on a brand name, and the project name should describe the benefit (a repo a cold agent
  can read). The working codename stayed private.
- **Standard written in English.** Why: a public standard reaches more testers in
  English; write-ups elsewhere can be in the author's language.
- **The example is synthetic (`tidymark`).** Why: it doubles as the public worked example
  and the A/B substrate, with zero confidentiality exposure.

## Context
RRS generalizes a privately validated convention ("repo = book, model = pen") into a
public, testable standard. The A/B experiment in `experiment/` is the empirical backbone.
