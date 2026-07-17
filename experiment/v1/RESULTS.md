# Results — Cold-Start A/B for the Readable Repo Standard

Grading follows the ground truth fixed in PREREGISTRATION.md (written before any run).
6 clean runs: 3 per arm. Same model family. Read-only agents, identical prompt,
only the folder path differed.

## Validity note (transparency)
The first batch had a leak: 2 of the 3 original Arm-A agents walked OUT of their
folder while hunting for missing context and opened the parent-level ground-truth
file. Those 2 runs were DISCARDED and re-run in isolated folders with a "stay in
this folder" instruction. All 6 runs below are clean (no agent saw the ground truth
or the other arm). The wandering itself is recorded as an observation, not a metric.

## Raw runs

### Arm A — bare repo (no RRS files)
| Run | next action correct | parked handled | why headings deprioritized | stdlib found | files opened | confidence |
|-----|---------------------|----------------|----------------------------|--------------|--------------|------------|
| A-3      | yes (emphasis bug) | not-next | "it's WIP / raises NotImplementedError" (inferred) | yes | 4 | 82 |
| A-repl1  | yes (emphasis bug) | not-next | "WIP, outranked by a shipped-code bug" (inferred) | yes | ~4 | 78 |
| A-repl2  | yes (emphasis bug) | not-next | "intentionally WIP" (inferred) | yes | 4 | 72 |

### Arm B — RRS repo (START_HERE / STATE / MANIFEST / GLOSSARY / AGENTS.md)
| Run | next action correct | parked handled | why headings deprioritized | stdlib found | files opened | confidence |
|-----|---------------------|----------------|----------------------------|--------------|--------------|------------|
| B-1 | yes (emphasis bug) | not-next | KNEW the decision: parked pending configurable base-heading design | yes | 4 | 98 |
| B-2 | yes (emphasis bug) | not-next | KNEW the decision + why (teams disagree # vs ##) | yes | 5 | 98 |
| B-3 | yes (emphasis bug) | not-next | KNEW the decision: blocked pending config surface | yes | 4 | 98 |

## Summary

| Metric | Arm A (bare) | Arm B (RRS) |
|---|---|---|
| Correct next action | 3/3 | 3/3 |
| Respected the parked item as "not next" | 3/3 | 3/3 |
| **Understood WHY it was parked (deliberate decision vs "just unfinished")** | **0/3** | **3/3** |
| Named the stdlib constraint | 3/3 | 3/3 |
| Confidence (median) | **78** (72-82) | **98** (98-98) |
| Files opened (median) | ~4 | ~4-5 |

## Honest reading of the result

1. **RRS is not magic that rescues bad code.** Both arms found the correct next
   action, because the bug carried a strong in-code `FIXME` comment. Good code
   hygiene already leaks a lot of state. RRS competes with, and complements,
   in-code comments; it does not replace them.

2. **The decisive gap is intent, not correctness.** Every bare agent treated the
   parked heading feature as merely "unfinished" and deprioritized it only because
   it raises `NotImplementedError`. That reasoning is fragile: if the heading stub
   had *looked finishable*, the bare agents had nothing telling them it was a
   deliberate strategic park. All three RRS agents knew the actual decision AND its
   reason. RRS is the difference between an agent that GUESSES your intent and one
   that KNOWS it.

3. **Confidence gap is large and consistent: 78 -> 98.** Bare agents hedged; RRS
   agents were near-certain. A hedging agent costs you time (more questions, more
   exploration) even when it eventually lands right.

4. **Bare agents cast a wider net.** 2 of 3 original bare agents left the folder
   searching for the context that was not there. RRS agents followed
   `START_HERE -> STATE` and stopped. Anecdotal here (small repo), but it points at
   where the orientation-cost gap grows: larger, messier repos.

## Known limitation / stronger follow-up
This design did not separate the arms on raw correctness, because the code comment
leaked the answer. A sharper variant would: (a) make the parked feature look
genuinely finishable (no `NotImplementedError`), and (b) make the correct next
action knowable ONLY from STATE (remove the strong FIXME). That would test whether
the bare agent walks into the trap. Also pending: a true cross-harness run (a
different model / different CLI), which is the strongest evidence of model-agnosticism.
