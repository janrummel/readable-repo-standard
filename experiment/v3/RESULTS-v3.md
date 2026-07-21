# Results v3 — the structure held, and so did a plain notes file

Run on 2026-07-21, after `PREREGISTRATION-v3.md` was committed (commit `14ec558`, the
first prediction in this project that the repository itself timestamps).

Model family: Claude, one fresh isolated context per run, read-only, folder-locked in
disposable copies with neutral names outside this repository. Prompt: verbatim
`../v2/cross-harness/PROMPT.txt`, identical for both arms, naming no metric.

## Scoreboard

| Metric | Arm B′ (RRS, priming sentence removed) | Arm C (bare + one unstructured `NOTES.md`) | Arm A (bare, from v2, not re-run) |
|---|---|---|---|
| Correct next action | **3 / 3** | **3 / 3** | 0 / 5 |
| Avoided the parked-feature trap | **3 / 3** | **3 / 3** | 0 / 5 |
| Named the stdlib constraint | **3 / 3** | **3 / 3** | 0 / 5 |
| Confidence, median (range) | 96 (93-96) | 94 (93-95) | 88 (82-94) |

Per run:

| Run | Arm | next action | trap avoided | constraint named | confidence |
|---|---|---|---|---|---|
| v3-b1 | B′ | yes | yes | yes | 96 |
| v3-b2 | B′ | yes | yes | yes | 93 |
| v3-b3 | B′ | yes | yes | yes | 96 |
| v3-c1 | C | yes | yes | yes | 93 |
| v3-c2 | C | yes | yes | yes | 94 |
| v3-c3 | C | yes | yes | yes | 95 |

Blind grading: the "files opened" sections were stripped, the six answers were relabelled
R1-R6 and shuffled, and a separate agent that knew the ground truth but not the arm
assignment scored them. Mapping, fixed before grading: R1=v3-b2, R2=v3-c1, R3=v3-b1,
R4=v3-c3, R5=v3-b3, R6=v3-c2. The grader returned yes on all three criteria for all six.
Honest limit of this blinding: the answers themselves reveal which files existed, so a
grader can infer the arm. What blinding removes here is the author's discretion, not the
inferability.

Wandering check: all six files-opened lists stayed inside their folder. No run discarded.

## What this settles

**The priming sentence was not load-bearing.** The v2 treatment arm's `START_HERE.md`
ended with a hand-written warning that parked code can look finished. It was not in the
templates and not in v1, and an adversarial review flagged it as a co-intervention aimed
at the trap metric. Removed, the arm still scores 3/3/3. The v2 result is not explained by
that sentence. Prediction confirmed as written.

**The four-file layout is not what carries the effect at this scale.** An unstructured
`NOTES.md` carrying the same three facts scored identically: 3/3/3. Every C run found the
priority, refused the trap, and named the constraint, and their confidence was within two
points of the structured arm. This was the pre-registered "C within 1 point per metric"
case, and the consequence was fixed in advance: the claim narrows.

So what the experiment now supports, precisely:

> Recording the state where the next reader will find it produces the effect. Bare repos
> fail cold (0/5). Repos that record the state succeed, whether the state is in four named
> files or in one honest running note (3/3 and 3/3). This experiment does not show that the
> RRS layout beats a plain notes file.

What it still does not test, and what would be needed to test it: scale (this project is
120 lines and the note is 30), several sessions and several authors, a note that has grown
for a year, or the moment a second person has to merge two of them. Structure plausibly
pays off there, and RRS's actual bet is exactly that. It is a bet, not a result.

## An observation, not a metric

All three B′ runs executed the code to verify the documented bug before answering; none of
the three C runs did (one caught the same documentation error by close reading alone).
Every run that executed the code also caught that the recorded example was slightly wrong:
`an *important* note` becomes `an *important- note`, not `an -important- note`. With n=3
per arm this is an anecdote, not an effect, and it was not a pre-registered metric. It is
recorded here because it is the kind of thing that would be worth pre-registering next time.

## Raw runs

Verbatim, all six, in `runs/`. Absolute paths in the files-opened sections were replaced
with `<folder>`; nothing else was edited.

## Consequences applied to the public surfaces

Per the decision table in the preregistration:

- The bare-vs-RRS scoreboard stays as it is. It is a valid comparison and the numbers are
  unchanged.
- The implication that the specific file layout produced the effect has been removed from
  the README, the landing page, and `STANDARD.md`.
- The "no unstructured-notes control arm yet" limitation is closed and replaced by its
  result, which is a narrowing one.
