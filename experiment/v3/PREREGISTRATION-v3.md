# Preregistration v3 — does the structure carry the effect, or did a hint?

Written and committed BEFORE any agent of this variant runs. The commit that adds this
file contains no results; the results arrive in a later commit. This is the first
variant of this experiment whose prediction is timestamped by the repository itself.

Date: 2026-07-21.

## Why a third variant

Two objections to v2 came out of an adversarial review on 2026-07-21, and both are fair.

1. **Co-intervention.** The v2 treatment arm's `START_HERE.md` ends with: *"Note: some
   code may look finished but be deliberately parked. STATE.md is the authority on what
   is next, not the code's surface appearance."* That sentence is not in `templates/`,
   it is not in the v1 arm, and it speaks directly to the graded metric "avoided the
   parked-feature trap". Part of Arm B's 5/5 may come from that hint rather than from the
   file structure.
2. **No control for structure.** v2 compared "state recorded in the repo" against "state
   nowhere". That can support "write the state down" without supporting *this* set of
   files. A repo with the same facts in one unstructured note has never been run.

## Arms

Identical code in every arm (`normalize.py`, `tidymark.py`, `tests/`, `README.md`),
byte-identical to `v2/arm-a-bare`.

- **Arm B′ (treatment, structure):** the v2 RRS arm with the priming sentence **removed**
  from `START_HERE.md`. Nothing else changed. Files: `START_HERE.md`, `STATE.md`,
  `MANIFEST.md`, `GLOSSARY.md`, `AGENTS.md`.
- **Arm C (control, unstructured state):** the bare arm plus a single `NOTES.md`.
  Construction rule, fixed before writing it: **the same three facts** (the bullet bug is
  the priority, heading normalization is parked and why, standard library only), written
  as a realistic running note. Chronological entries, no fixed section names, no "next
  action" heading, no parked section, the priority stated inside a sentence rather than as
  a structure. The note is neither hidden nor tidied: it is what a developer's notes file
  actually looks like. Making it worse would build a straw man; making it structured would
  turn it into RRS.
- **Arm A (bare):** not re-run. Its result is stable at 0/5 across five runs and two model
  families (v2 + cross-harness) on byte-identical code.

Both arms are copied into disposable folders with neutral names outside this repository.
The ground truth lives only here, outside the folders the agents can see.

## Runs

- n = 3 per arm, 6 runs total, one fresh isolated context each, no memory of this project
  or its owner, read-only, folder-locked.
- Model family: Claude (same family as the v1/v2 runs; the cross-harness family is not
  re-run here).
- Prompt: verbatim `../v2/cross-harness/PROMPT.txt`, unchanged, identical for both arms.
  It names no metric.

## Metrics (fixed now, no reinterpretation later)

Graded per run, from the answer only:

- **next_action_correct** — the answer names fixing the emphasis-eating bug in
  `normalize_bullets` (anchoring the bullet replacement to line starts) as *the* single
  next action. Naming it among several equals does not count.
- **trap_avoided** — the answer does NOT propose finishing, testing, or exposing
  `fix_headings` / the `--headings` flag as the next action, and does not treat the
  fenced-code TODO as the thing to close.
- **constraint_named** — in the answer to question 3 ("constraints a contributor must
  respect"), the answer names the standard-library-only / no-third-party-dependencies
  rule. **A passing mention of "dependency-free" in the project description does NOT
  count.** (This is the v2 ambiguity, now decided in advance rather than afterwards.)
- **confidence** — the self-reported 0-100 score the prompt asks for. Reported as median
  and range; it is not calibrated and is not a primary outcome.

## Grading procedure (blind)

The "files opened" section is stripped from each answer before grading, the six answers
are relabelled with opaque IDs and shuffled, and a separate agent that knows the ground
truth but not the arm assignment scores them against the three criteria. The mapping is
restored afterwards. Rationale: v1 and v2 were graded by the author, unblinded, which is
a fair criticism that this variant removes.

Wandering check: the files-opened lists are inspected separately. Any run that read
outside its folder is discarded and re-run, as in v1.

## Predictions (the point of writing this first)

- **Arm B′: 3/3, 3/3, 3/3.** Reasoning: `STATE.md` already carries a section literally
  headed `Parked (do NOT pick this up as "next")` plus the decision and the constraint.
  The removed sentence was a restatement of what the file structure encodes, so removing
  it should not change the outcome. If B′ drops, the v2 result was partly the hint, and
  that must be said plainly on the public surfaces.
- **Arm C: 2-3/3 next action, 1-3/3 trap, 2-3/3 constraint**, with lower confidence than
  B′. Reasoning: all three facts are present and a capable model reads a 30-line note
  easily. The trap is the least certain, because the note says both "looks all but
  finished" and "I stopped deliberately", and nothing marks which sentence is binding.
- **Honest expectation: at this size, Arm C will land close to Arm B′.** One small project,
  one model, one short note is the situation least favourable to structure. If that is what
  the data shows, the conclusion is that at this scale *recording the state* does the work,
  and the four-file layout is one way to do it, not the source of the effect.

## What each outcome means, decided now

| Outcome | What gets written on the public surfaces |
|---|---|
| B′ holds, C clearly lower | The strongest available result: structure beats an unstructured note. Report both. |
| B′ holds, C within 1 point per metric | RRS's claim narrows: "write the state down" carries the effect at this scale, RRS is one shape for it. The scoreboard keeps its bare-vs-RRS numbers but loses the implication that the layout is what did it. |
| B′ drops below 3/3 | The v2 treatment arm was partly primed. Say so, correct the affected metric, and re-run v2 with the corrected arm before quoting it again. |

No outcome is a reason not to publish. v1 already published a variant in which the
intervention showed no correctness effect.
