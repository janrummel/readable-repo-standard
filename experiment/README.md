# Experiment — does RRS actually help a cold agent?

A pre-registered A/B test. One synthetic project (`tidymark`) in arms that differ ONLY in
how its working state is recorded, from not at all to four named files. Blank, read-only AI agents are dropped into each
arm cold and asked for the single correct next action plus any binding constraints. The
ground truth and the metrics were written down BEFORE any agent ran (see the
`PREREGISTRATION` files). One metric was read more strictly than its pre-registered
wording once the runs were in; that call and its effect on the score are disclosed in the
honesty log below.

## Three variants

### v1 — state also leaked by a code comment (`v1/`)
The bullet bug carried a strong `FIXME` comment, so both arms could find the correct
action from the code alone. Result: both arms got the action right; RRS still won on
**confidence (median 78 -> 98)** and on **understanding WHY a feature was parked**
(bare agents only inferred "it's unfinished"; RRS agents knew the actual decision).

### v2 — state only in STATE.md, the realistic case (`v2/`)
Sharpened: the parked feature was made to LOOK finishable (no `NotImplementedError`) and
the `FIXME` was removed, so the correct next action was knowable only from `STATE.md`.

| Metric | Bare repo | RRS repo |
|---|---|---|
| Correct next action | **0 / 3** | **3 / 3** |
| Avoided the parked-feature trap | **0 / 3** | **3 / 3** |
| Named the hidden constraint | **0 / 3** | **3 / 3** |
| Self-reported confidence (median) | 82 | 98 |

Every bare agent confidently worked on the wrong thing. One even spotted the real bug
and dismissed it, because nothing told it that was the priority.

### Cross-harness replication (`v2/cross-harness/`)
The v2 arms were re-run on 2026-07-19 with a different model family in a different
harness: GPT-5.4 via the OpenAI Codex CLI, fresh session per run, read-only, operated
by hand. Result: bare **0/2** vs RRS **2/2** on all three metrics; the bare runs were
even MORE confident while wrong (91-94) than the Claude runs. Combined v2 evidence:
**bare 0/5 vs RRS 5/5.** The foreign model also surfaced two real documentation defects
in the treatment files (both fixed in `../example/tidymark`, frozen arm copies untouched).

### v3 — the structure against a plain notes file (`v3/`)
Run 2026-07-21 after an adversarial review, with the preregistration committed first, so
this variant's prediction is timestamped by the repository. Two arms on identical code:
**B′**, the v2 RRS arm with a hand-written hint removed that a reviewer had flagged as
doing part of the work, and **C**, the bare arm plus one unstructured `NOTES.md` carrying
the same three facts. Grading was blind to the arm.

| Metric | B′ (RRS, hint removed) | C (one unstructured note) | A (bare, from v2) |
|---|---|---|---|
| Correct next action | **3 / 3** | **3 / 3** | 0 / 5 |
| Avoided the parked-feature trap | **3 / 3** | **3 / 3** | 0 / 5 |
| Named the stdlib constraint | **3 / 3** | **3 / 3** | 0 / 5 |
| Confidence, median | 96 | 94 | 88 |

Two findings, one comfortable and one not. The hint was not load-bearing, so the v2 result
stands on the files. And **an unstructured note carried the state just as well as the four
files at this scale**, so the effect belongs to *recording the state*, not to this layout.
Details and raw runs: [`v3/RESULTS-v3.md`](v3/RESULTS-v3.md).

## Honesty log
- Predictions were pre-registered before running (`PREREGISTRATION*` files).
- v1's first batch had a leak: 2 bare agents walked out of their folder while hunting
  for missing context and read the ground-truth file. Those runs were **discarded** and
  re-run in isolated, folder-locked copies. v2 was folder-locked from the start; no leak.
  (The wandering itself is a signal: bare agents cast a wider net for missing context.)
- Former limitation, closed 2026-07-19: the original runs all used the same model
  family. The cross-harness replication (GPT-5.4 / Codex CLI, see above) reproduced the
  split exactly.
- **One metric was tightened after the data was seen.** The pre-registered wording is
  "constraint_found: names stdlib-only". Both bare Codex runs called the tool
  "dependency-free" in their opening sentence but never listed it as a constraint to
  respect. They were graded NO, on the stricter reading "names it as a constraint".
  Under the literal pre-registered wording that metric would be **2/5 bare, not 0/5**.
  Both readings are reported here; the other two metrics are unaffected.
- **The cross-harness runs were not pre-registered.** They were an unplanned extension,
  graded against the existing v2 ground truth. Pre-registered: the v1 and v2 Claude runs,
  3 per arm.
- **v1 and v2 were graded by the author, unblinded, with no second rater.** The point
  above shows that the remaining discretion was real. v3 was graded blind: labels stripped
  and shuffled, scored by a separate agent that knew the ground truth but not the arm
  assignment.
- **Verbatim transcripts exist for the four cross-harness runs (`v2/cross-harness/`) and
  for all six v3 runs (`v3/runs/`).** The six earlier Claude runs are recorded as graded
  rows written by the operator, not as raw output.
- **The third arm has now been run, and it narrowed the claim.** v3 added the missing
  control (the same facts as one unstructured `NOTES.md`) and it scored the same as the
  four files. The evidence supports "write the state down where the next reader will find
  it". It does not support "this specific set of files beats a plain note", at least not at
  this scale.
- **This repo's git history begins after the v1 and v2 runs**, so those pre-registrations
  are documented, not independently timestamped. v3 is the first variant whose
  preregistration was committed before its runs.
- Remaining honest bounds: one synthetic project, one trap design, small n per arm, and
  self-reported confidence scores, which are not calibrated and not comparable between
  products.

## Reproduce it
Point a fresh agent at `v2/arm-a-bare` and then at `v2/arm-b-rrs` with the prompt in
`v2/cross-harness/PROMPT.txt`. Same code, opposite outcomes. For the narrower question,
whether the layout matters at all, rebuild the v3 arms from `v3/PREREGISTRATION-v3.md`,
which states exactly how each was constructed.
