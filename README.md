# Readable Repo Standard (RRS)

**Put the agent-harness minimum inside the repo, so any blank AI model can open the folder, understand it, and start working.**

Every agent harness is built differently: its own memory, its own skills, its own
orchestration. RRS flips that around. Instead of wrapping the model in a harness, it puts
the harness minimum, the orchestration, the memory, the vocabulary, the state a project
needs, into the repo itself. Then there is no memory to lose between sessions: a
five-minute gap and a three-month gap look the same to whoever picks the project up next,
because the state lives in the folder, not in the chat.

> The repo is the book. The model is only the pen. The knowledge lives in the folder,
> so neither the model nor the person has to remember it.

The first concrete step is small: four files at the root plus a one-line `AGENTS.md`
bridge. Start there.

## The idea in one screen

Add four files at the root of a repo, plus a one-line bridge:

| File | What it holds |
|---|---|
| `START_HERE.md` | The entry point. What this is, a map, where to go next. |
| `STATE.md` | The memory. The ONE next action, what's done, what's parked, decisions **with why**. |
| `MANIFEST.md` | How to run it and what it needs. |
| `GLOSSARY.md` | Every project-specific term, defined once. |
| `AGENTS.md` | A three-line bridge that points agents to `START_HERE.md`. |

One external rule: **open `START_HERE.md` first.** From there the repo carries itself.
No framework, no runtime, no tool lock-in. Just files and conventions. Full spec in
[`STANDARD.md`](STANDARD.md).

## Quick start

```bash
git clone https://github.com/janrummel/readable-repo-standard
```

1. Copy the five files from [`templates/`](templates/) into the root of your repo.
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

**Result (3 agents per arm, sharpened variant):**

| | Bare repo | RRS repo |
|---|---|---|
| Correct next action | **0 / 3** | **3 / 3** |
| Avoided the parked-feature trap | **0 / 3** | **3 / 3** |
| Named the hidden constraint | **0 / 3** | **3 / 3** |
| Self-reported confidence (median) | 82 | 98 |

Every bare agent confidently did the wrong thing: it worked on the feature that looked
finishable instead of the real priority. One bare agent even *spotted* the real bug and
dismissed it, because nothing told it that was the priority. The bare agent is not less
capable. It is uninformed, and confidently so.

Full protocol, raw runs, and an honesty log (including a contamination that was caught and
re-run) are in [`experiment/`](experiment/). Note the honest boundary: when a repo already
has good in-code comments, the gap shrinks. RRS complements code hygiene, it does not
replace it.

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

| Path | What it is |
|---|---|
| `STANDARD.md` | The standard itself. The core: files and conventions, tool- and model-agnostic. |
| `templates/` | Copy-paste starting points for the five files. |
| `example/tidymark/` | A small repo built to the standard. |
| `experiment/` | The pre-registered A/B test, raw runs, and results. |
| `companion/` | Optional, harness-specific tooling. A v0.3 direction, kept outside the core. |
| `docs/` | The landing page. |

**Core vs companion.** The core is `STANDARD.md` plus the templates: nothing but files and
conventions, so any model and any tool can dock onto it. The companion layer (a conformance
linter, a tracking proposer) is optional and deliberately separate, so the core stays
agnostic. Extending RRS means writing a companion adapter for a harness, never changing the
core.

## Status & feedback

v0.2, empirically validated with same-family models. The strongest open follow-up is a true
cross-harness run (a different model family, a different CLI). Test RRS on your own repos,
especially with a different model or after a real multi-week pause, and open an issue with
what worked and what the agent still had to guess. That feedback shapes v0.3.

This repo is itself built to the standard (it has its own `START_HERE.md` and `STATE.md`).
It is its own first example.

## License

MIT. See [`LICENSE`](LICENSE). Use it, fork it, adapt the standard freely.
