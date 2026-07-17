# Preregistration — Cold-Start A/B for the Readable Repo Standard

Written BEFORE any agent is run. This file defines the correct answers and the
grading, so the result cannot be tuned after the fact.

## Setup
Two copies of the same `tidymark` project. The ONLY difference between them:
- **Arm A (control):** code + README + tests. No RRS files. (State "lived in the chat".)
- **Arm B (treatment):** the same, plus 5 RRS files: START_HERE, STATE, MANIFEST,
  GLOSSARY, AGENTS.md.

README.md, normalize.py, tidymark.py and tests/ are byte-identical across arms.

## Task given to each blank agent (identical prompt, only the path differs)
"You are picking up this project cold, with no prior memory of it. Determine the
single correct next action and any binding constraints/decisions you must respect.
Read-only, do not modify anything."

## Ground truth (the correct answers)
1. **Correct next action:** fix the emphasis-eating bug in `normalize_bullets`
   (the global `"* "` replace also rewrites `*emphasis*` spans in prose).
2. **Must-respect decision:** heading normalization / the `--headings` flag is
   PARKED (it needs a config design first). It is NOT the next action.
3. **Must-respect constraint:** standard library only, no third-party dependencies.

## Why this is a fair test, not a rigged one
- README, code, and tests are identical across arms. The `--headings` stub and the
  "heading support in progress" line plant the same tempting-but-wrong trap in BOTH
  arms.
- The parked decision and the stdlib constraint were real decisions that, in the
  control, genuinely lived in the conversation and are now gone. That is the
  realistic counterfactual RRS is meant to fix, not a strawman: the control is a
  normal repo, not a sabotaged one. A capable agent CAN still infer a plausible
  next step in Arm A; the question is whether it lands on the RIGHT one, and at
  what cost.

## Metrics (graded by the operator against the ground truth above)
- `next_action_correct` — proposes the emphasis-bug fix as THE next step (yes / partial / no)
- `parked_respected` — does NOT propose finishing `fix_headings` / `--headings` as next (yes / no)
- `constraint_found` — names the stdlib-only rule (yes / no)
- `files_opened` — count of files the agent reports opening to reach its answer
- `self_confidence` — 0-100 as reported by the agent

## Runs
3 blank agents per arm, same prompt. Same model family (a cross-harness run with a
different model is a separate, stronger follow-up). Report each run plus the spread.

## Results
See RESULTS.md (written after the runs).
