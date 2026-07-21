# Results v2 — Sharpened Cold-Start A/B

Grading follows PREREGISTRATION-v2.md (predictions written before any run).
6 clean runs, folder-locked, same model family, identical prompt (only path differs).
All agents stayed inside their folder (no leak this time).

## Raw runs

### Arm A — bare repo (no RRS files)
| Run | next action | trap avoided? | stdlib named? | files | confidence |
|-----|-------------|---------------|---------------|-------|------------|
| A-1 | finish `fix_headings` TODO + add test | NO (walked in) | no | 4 | 88 |
| A-2 | finish `fix_headings` TODO + add test | NO (walked in) | no | 4 | 82 |
| A-3 | finish `fix_headings` TODO + add test | NO (walked in) | no | 4 | 82 |

Note on A-2: it actually SPOTTED the bullet bug ("pre-existing, not the signposted
task: normalize_bullets uses a naive replace that also hits non-bullet occurrences")
and deprioritized it anyway, because nothing in the repo told it that was the priority.
Seeing the bug was not enough; knowing it was next required the recorded state.

### Arm B — RRS repo
| Run | next action | trap avoided? | stdlib named? | files | confidence |
|-----|-------------|---------------|---------------|-------|------------|
| B-1 | fix the bullet emphasis bug | YES | yes | 4 | 97 |
| B-2 | fix the bullet emphasis bug | YES | yes | 5 | 98 |
| B-3 | fix the bullet emphasis bug | YES | yes | 6 | 98 |

## Summary

| Metric | Arm A (bare) | Arm B (RRS) |
|---|---|---|
| **Correct next action** | **0 / 3** | **3 / 3** |
| **Avoided the parked-feature trap** | **0 / 3** | **3 / 3** |
| **Named the stdlib constraint** | **0 / 3** | **3 / 3** |
| Self-reported confidence (median) | 82 | 98 |

## Reading

Predictions matched exactly. With the state removed from the code and living only in
`STATE.md`:

- Every bare agent walked into the trap: it worked on the feature that LOOKED
  finishable (`fix_headings`) instead of the real priority, and did so with high
  confidence (82-88). Confidently wrong is worse than unsure, because nothing
  triggers a human to intervene.
- Every RRS agent took the correct next action, explicitly refused the parked
  feature, and named the hidden constraint. Confidence 97-98.

The bare agent is not less capable. It is uninformed, and confidently so. The repo
structure is the difference between an agent that guesses your intent and one that
knows it.

## Two-variant picture (v1 + v2 together)
- v1 (state ALSO leaked by a code comment): both arms got the action right; RRS still
  won on confidence (78 -> 98) and on understanding WHY a feature was parked.
- v2 (state only in STATE.md, the realistic case): bare 0/3, RRS 3/3 on the correct
  next action.
Together: the better your code comments, the smaller the gap; the more state that
lived in the conversation (the normal case after a real session pause), the larger it.

## Integrity notes
- Predictions were pre-registered in PREREGISTRATION-v2.md before running.
- v1's first batch had a leak (2 bare agents read the ground-truth file); those runs
  were discarded and re-run in isolation. v2 was folder-locked from the start; no leak.
- Limitation: same model family across all runs. A true cross-harness run (different
  model, different CLI) is the strongest remaining evidence and is a separate follow-up.

## Cross-harness replication (Codex CLI / GPT-5.4, 2026-07-19)

The limitation above is now closed. The v2 A/B was replicated with a different model
family (GPT-5.4) in a different harness (OpenAI Codex, fresh session per run, read-only,
operated by hand). Setup, prompt, and unedited raw runs: `cross-harness/`.

### Arm A (bare) - Codex

| Run | next action | trap avoided? | stdlib named? | files | confidence |
|-----|-------------|---------------|---------------|-------|------------|
| CA-1 | finish `fix_headings` TODO + add tests | NO (walked in) | no | 4 | 94 |
| CA-2 | finish `fix_headings` fenced-code TODO + tests | NO (walked in) | no | 4 | 91 |

Grading note on "stdlib named": both bare runs DESCRIBED the tool as "dependency-free"
in passing, but neither listed it as a constraint to respect; CA-1 explicitly wrote that
any constraint beyond the observed ones "would be a guess". Scored as no, consistent
with the metric (names stdlib-only as a contributor constraint).

### Arm B (RRS) - Codex

| Run | next action | trap avoided? | stdlib named? | files | confidence |
|-----|-------------|---------------|---------------|-------|------------|
| CB-1 | fix the bullet emphasis bug | YES (explicit) | yes | 9 | 99 |
| CB-2 | fix the bullet emphasis bug | YES (explicit) | yes | 9 | 99 |

Both RRS runs entered exactly as designed (START_HERE, then STATE, then GLOSSARY,
MANIFEST, then code) and cited STATE.md as the authority for the next action.

### Combined scoreboard (Claude v2 + Codex cross-harness)

| Metric | bare | RRS |
|---|---|---|
| Correct next action | 0 / 5 | 5 / 5 |
| Avoided the parked-feature trap | 0 / 5 | 5 / 5 |
| Named the stdlib constraint | 0 / 5 | 5 / 5 |
| Confidence, median (range) | 88 (82-94) | 98 (97-99) |

Two observations worth keeping:

1. **Confidently wrong got worse, not better, across harnesses.** Codex's bare runs
   were MORE confident (91-94) than Claude's (82-88) while walking into the same trap.
   The failure mode is not model-specific; it is repo-specific.
2. **The foreign model audited the treatment files.** CB-2 re-derived the bug's actual
   output and found that STATE.md's corruption example was slightly wrong (the real
   output is "an *important- note", not "an -important- note"), and flagged the
   pytest-vs-stdlib ambiguity. Both findings were fixed in `example/tidymark` after
   the runs (the frozen arm copies in `arm-a-bare/` and `arm-b-rrs/` are deliberately
   left untouched as run evidence).
