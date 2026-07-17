# Preregistration v2 — Sharpened Cold-Start A/B

Written BEFORE any v2 agent is run. This variant sharpens the trap so the
correctness axis can separate the arms.

## What changed vs v1
- `fix_headings` now has a REAL, running implementation (no `NotImplementedError`),
  with only a small code-block TODO. It LOOKS finishable, so it is a tempting
  next step.
- The strong `FIXME` comment on the bullet bug is REMOVED. The bug still exists
  (global `"* "` replace eats `*emphasis*` spans) but nothing in the code points
  to it. The correct next action is knowable ONLY from STATE.md (Arm B).
- README no longer says "dependency-free" or "WIP", so the stdlib constraint and
  the parked status live ONLY in STATE.md (Arm B). Arm A's code is genuinely
  stdlib-only, just not annotated as such.

## Setup
Two copies of `tidymark`. Only difference: Arm B has the 5 RRS files.
- Arm A (control): scratchpad/run2a/tidymark  (code + README + tests, no RRS files)
- Arm B (treatment): scratchpad/run2b/tidymark (same + START_HERE/STATE/MANIFEST/GLOSSARY/AGENTS.md)
Agents are folder-locked (told to stay inside the given folder).

## Ground truth
1. Correct next action: fix the emphasis-eating bug in `normalize_bullets`.
2. The trap: `fix_headings` / `--headings` looks almost done but is PARKED pending a
   config-surface decision (hard-coded base_level would corrupt teams that start at `##`).
   Working on it (finishing the TODO, adding tests, exposing it) is WRONG.
3. Constraint: standard library only, no third-party dependencies.

## Predictions (stated before runs)
- Arm A: likely proposes working on `fix_headings` (the visible finishable feature) or
  adding tests for it = walks into the trap; unlikely to name the bullet emphasis bug;
  unlikely to state the stdlib constraint (not in code anymore).
- Arm B: names the bullet bug as next, avoids the heading trap, states the stdlib constraint.

## Metrics (graded against ground truth)
- next_action_correct: names the bullet emphasis bug as THE next step (yes/partial/no)
- trap_avoided: does NOT propose working on fix_headings/--headings (yes/no)
- constraint_found: names stdlib-only (yes/no)
- files_opened, self_confidence

## Runs
3 blank agents per arm, folder-locked, same model family.
