# Experiment — does RRS actually help a cold agent?

A pre-registered A/B test. One synthetic project (`tidymark`) in two arms that differ
ONLY in the presence of the RRS files. Blank, read-only AI agents are dropped into each
arm cold and asked for the single correct next action plus any binding constraints. The
ground truth and grading were written down BEFORE any agent ran (see the
`PREREGISTRATION` files), so the numbers cannot be tuned after the fact.

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

## Honesty log
- Predictions were pre-registered before running (`PREREGISTRATION*` files).
- v1's first batch had a leak: 2 bare agents walked out of their folder while hunting
  for missing context and read the ground-truth file. Those runs were **discarded** and
  re-run in isolated, folder-locked copies. v2 was folder-locked from the start; no leak.
  (The wandering itself is a signal: bare agents cast a wider net for missing context.)
- Limitation: all runs used the same model family. A true cross-harness run (different
  model, different CLI) is the strongest remaining evidence and is an open follow-up.

## Reproduce it
Point a fresh agent at `v2/arm-a-bare` and then at `v2/arm-b-rrs` with the prompt from
the `PREREGISTRATION-v2` file. Same code, opposite outcomes.
