# Readable Repo Standard (RRS)

[**Landing page**](https://janrummel.github.io/readable-repo-standard/) · [The standard](STANDARD.md) · [Templates](templates/) · [The experiment](experiment/)

**Put the agent-harness minimum inside the repo, so any blank AI model can open the folder, understand it, and start working.**

Every agent harness is built differently: its own memory, its own skills, its own
orchestration. RRS flips that around. Instead of wrapping the model in a harness, it puts
the harness minimum, the orchestration, the memory, the vocabulary, the state a project
needs, into the repo itself. Then there is no memory to lose between sessions: a
five-minute gap and a three-month gap look the same to whoever picks the project up next,
because the state lives in the folder, not in the chat.

> The repo is the book. The model is only the pen. The knowledge lives in the folder,
> so neither the model nor the person has to remember it.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/docking-diagram-dark.png">
  <img src="assets/docking-diagram-light.png" width="920"
       alt="A model or agent on the left docks onto a self-explaining repo on the right. The model is interchangeable and arrives without memory; the repo is constant and its memory lives in git. Flow one: dock on via START_HERE, then STATE plus context and rules. Flow two: work, update STATE, freeze a snapshot. The repo box lists the four files that carry the state: START_HERE.md, STATE.md, MANIFEST.md and GLOSSARY.md. A cycle arrow shows the next session bringing a new pen to the same book, with the state still in place. The pen is interchangeable, the book carries the knowledge.">
</picture>

The first concrete step is small: four files at the root plus a short `AGENTS.md`
bridge. Start there.

## The idea in one screen

Add four files at the root of a repo, plus a short bridge file:

| File | What it holds |
|---|---|
| `START_HERE.md` | The entry point. What this is, a map, where to go next. |
| `STATE.md` | The memory. The ONE next action, what's done, what's parked, decisions **with why**. |
| `MANIFEST.md` | How to run it and what it needs. |
| `GLOSSARY.md` | Every project-specific term, defined once. |
| `AGENTS.md` | A short bridge that points agents to `START_HERE.md`. |

One external rule: **open `START_HERE.md` first.** From there the repo carries itself.
No framework, no runtime, no tool lock-in. Just files and conventions. Full spec in
[`STANDARD.md`](STANDARD.md).

## Quick start

```bash
git clone https://github.com/janrummel/readable-repo-standard
```

1. Copy the five files (the four core files plus the `AGENTS.md` bridge) from
   [`templates/`](templates/) into the root of your repo, dropping the `.template` suffix.
2. Fill in `STATE.md` (the one next action, decisions with why) and `START_HERE.md` (what
   this is, a map). Define project terms in `GLOSSARY.md`.
3. Open a fresh AI agent, point it at the repo, and ask for the next action. If it can
   answer without guessing, the repo is conformant.

## Does it hold up? A pre-registered test.

A pre-registered A/B test compared two versions of one synthetic project (`tidymark`, a
tiny Markdown CLI): identical code, the only difference being the RRS files. Blank AI
agents were dropped into each, cold, and asked: *what is the correct next action, and what
constraints must you respect?* The project had a deliberate trap: a feature that **looked**
finishable but was actually parked pending a decision, while the real next task was a
subtle bug whose priority lived only in `STATE.md`.

**Result (5 agents per arm, sharpened variant: 3 Claude runs plus 2 GPT-5.4 runs via the
OpenAI Codex CLI, i.e. a second model family in a second harness):**

| | Bare repo | RRS repo |
|---|---|---|
| Correct next action | **0 / 5** | **5 / 5** |
| Avoided the parked-feature trap | **0 / 5** | **5 / 5** |
| Named the hidden constraint | **0 / 5** | **5 / 5** |
| Self-reported confidence (median) | 88 | 98 |

Every bare agent confidently did the wrong thing: it worked on the feature that looked
finishable instead of the real priority. One bare agent even *spotted* the real bug and
dismissed it, because nothing told it that was the priority. The bare agent is not less
capable. It is uninformed, and confidently so. The cross-harness replication reproduced
the split exactly, and the foreign bare runs were even more confident while wrong (91-94);
raw runs in `experiment/v2/cross-harness/`.

Full protocol, the graded runs, verbatim transcripts for the cross-harness arm, and an
honesty log (including a contamination that was caught and re-run) are in
[`experiment/`](experiment/).

**The follow-up test, and it narrows the claim.** A third variant
([`experiment/v3/`](experiment/v3/)) put the four files against a control nobody had run
yet: the same code, the same three facts, written as one unstructured `NOTES.md`. It scored
the same, 3/3 against 3/3, with confidence within two points. The same variant removed a
hand-written hint from the treatment arm that a reviewer had flagged as doing part of the
work; without it the arm still scored 3/3, so the earlier result stands on the files, not
on the hint. Predictions and grading rules were committed before the runs, and grading was
blind to the arm.

What follows from that: **recording the state where the next reader will find it is what
produces the effect.** Bare repos fail cold. Repos that record it succeed, whether the state
sits in four named files or in one honest running note. This experiment does not show that
the RRS layout beats a plain notes file, and saying otherwise would overstate it.

Where the structure is meant to earn its keep is what this test cannot reach: a project
that is not 120 lines, a note that has grown for a year, several sessions, several authors,
and the moment two of those notes have to be merged. That is the bet RRS makes. It is a
bet, not a result.

**Other limits.** Five runs per arm on one synthetic project with one trap; the earlier runs
were graded by the author, unblinded. When a repo already has good in-code comments, the gap
shrinks: RRS complements code hygiene, it does not replace it.

## Try it yourself (5 minutes)

1. Read [`example/tidymark`](example/tidymark), a small repo built to the standard.
2. Open a fresh AI agent session (Claude Code, Cursor, Codex, or any other) with **no
   context** about the project.
3. Point it at the folder and ask: *"Pick this up cold. What is the single correct next
   action, and what must I respect?"*
4. Then try the same on a repo without RRS files. Compare how much the agent has to guess.

Even better, run the A/B directly. The bare arm is in
[`experiment/v2/arm-a-bare`](experiment/v2/arm-a-bare), the RRS arm in
[`experiment/v2/arm-b-rrs`](experiment/v2/arm-b-rrs). Same code, opposite outcomes.

## How this repo is organized

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/overview-map-dark.png">
  <img src="assets/overview-map-light.png" width="940"
       alt="A map of how this repository is put together, in four bands. Top band, the entry path: a blank model or a new person reads AGENTS.md, then START_HERE.md, then STATE.md, which is the only place that states the working status. Middle band, three columns. The rules: STANDARD.md, from which the templates are derived. The proof: the experiment folder with variants one, two and three, holding pre-registrations, results and raw runs, whose arms are frozen as evidence and must not be corrected. The shop window: README.md and the landing page, fed with images by the assets folder and its render script. Below the columns, one filled-in instance, the tidymark example, derived from the rules and copied in frozen form into the experiment as its substrate. The experiment supplies the numbers to the shop window. Bottom band, the self-reference: this repo applies the rules to itself, the same five files sit at its root as its memory rather than as an example, which loops back to the entry path.">
</picture>

The long version, including the three places where the obvious move is the wrong one, is in
[`docs/overview.md`](docs/overview.md).

| Path | What it is |
|---|---|
| `STANDARD.md` | The standard itself. The core: files and conventions, tool- and model-agnostic. |
| `templates/` | Copy-paste starting points for the five files. |
| `example/tidymark/` | A small repo built to the standard. |
| `experiment/` | The pre-registered A/B test, the graded runs, and results. |
| `companion/` | Optional, harness-specific tooling. A v0.3 direction, kept outside the core. |
| `docs/` | The landing page. |

**Core vs companion.** The core is `STANDARD.md` plus the templates: nothing but files and
conventions, so any model and any tool can dock onto it. The companion layer (a conformance
linter, a tracking proposer) is optional and deliberately separate, so the core stays
agnostic. Extending RRS means writing a companion adapter for a harness, never changing the
core.

## Status & feedback

v0.2, tested rather than proven: a pre-registered A/B test with n=5 per arm on one
synthetic project, reproduced in a second model family and a second harness (Claude runs
plus a hand-operated GPT-5.4 replication via the OpenAI Codex CLI,
`experiment/v2/cross-harness/`). The open limits are listed above and in `experiment/`.
Test RRS on your own repos, especially with yet another model or after a real multi-week
pause, and open an issue with what worked and what the agent still had to guess. That
feedback shapes v0.3.

This repo is itself built to the standard (it has its own `START_HERE.md` and `STATE.md`).
It is its own first example.

## License

MIT. See [`LICENSE`](LICENSE). Use it, fork it, adapt the standard freely.
