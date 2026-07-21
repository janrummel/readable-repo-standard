# Experiment — does RRS actually help a cold agent?

A pre-registered A/B test. One synthetic project (`tidymark`) in two arms that differ
ONLY in the presence of the RRS files. Blank, read-only AI agents are dropped into each
arm cold and asked for the single correct next action plus any binding constraints. The
ground truth and the metrics were written down BEFORE any agent ran (see the
`PREREGISTRATION` files). One metric was read more strictly than its pre-registered
wording once the runs were in; that call and its effect on the score are disclosed in the
honesty log below.

## Two variants

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
- **Grading was done by the author, unblinded, with no second rater.** Arm identity is
  visible in any transcript, so blinding was not possible without rewriting the runs; the
  point above shows that the remaining discretion was real.
- **Verbatim transcripts exist only for the four cross-harness runs**
  (`v2/cross-harness/`). The six Claude runs are recorded as graded rows written by the
  operator, not as raw output.
- **No third arm.** There is no control that carries the same facts as unstructured notes
  (a `NOTES.md`), so the comparison is "state recorded in the repo" vs "state nowhere".
  Until that arm exists, the evidence supports "write the state down" more strongly than
  it supports this specific set of files.
- **This repo's git history begins after all runs**, so the pre-registration is
  documented, not independently timestamped.
- Remaining honest bounds: one synthetic project, one trap design, small n per arm, and
  self-reported confidence scores, which are not calibrated and not comparable between
  products.

## Reproduce it
Point a fresh agent at `v2/arm-a-bare` and then at `v2/arm-b-rrs` with the prompt in
`v2/cross-harness/PROMPT.txt`. Same code, opposite outcomes.
