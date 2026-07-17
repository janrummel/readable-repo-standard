# Readable Repo Standard (RRS)

**Build your project repo so any AI agent can pick it up cold and continue from where you left off, without you re-explaining anything.**

An AI agent has no memory between sessions. A five-minute gap and a three-month gap
look identical to it: it starts from zero every time. And after a long pause, *you*
have forgotten the state too. RRS moves the memory out of your head and out of the
chat, into the repo itself.

> The repo is the book. The model is only the pen. The knowledge lives in the folder,
> so neither the model nor you has to remember it.

## The idea in one screen

Add four files at the root of your repo, plus a one-line bridge:

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

## Does it actually help? We measured it.

We ran a pre-registered A/B test. One synthetic project (`tidymark`, a tiny Markdown
CLI) in two versions, identical code, the only difference being the RRS files. Then we
dropped **blank AI agents** into each, cold, and asked: *what is the correct next
action, and what constraints must you respect?* The project had a deliberate trap: a
feature that **looked** finishable but was actually parked pending a decision, and the
real next task was a subtle bug whose priority lived only in `STATE.md`.

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

Full protocol, raw runs, and an honesty log (including a contamination we caught and
re-ran) are in [`experiment/`](experiment/). Note the honest boundary: when a repo
already has good in-code comments, the gap shrinks — RRS complements code hygiene, it
does not replace it.

## Try it yourself (5 minutes)

1. Read [`example/tidymark`](example/tidymark) — a small repo built to the standard.
2. Open a fresh AI agent session (Claude Code, Cursor, Codex, whatever you use) with
   **no context** about the project.
3. Point it at the folder and ask: *"Pick this up cold. What is the single correct next
   action, and what must I respect?"*
4. Then try the same on one of your own repos without RRS files. Compare how much the
   agent has to guess.

Even better: run the A/B yourself. The bare arm is in
[`experiment/v2/arm-a-bare`](experiment/v2/arm-a-bare), the RRS arm in
[`experiment/v2/arm-b-rrs`](experiment/v2/arm-b-rrs). Same code, opposite outcomes.

## Templates

Copy-paste starting points for your own repo are in [`templates/`](templates/).

## Status & feedback

v0.2, empirically validated with same-family models. The strongest open follow-up is a
true cross-harness run (a different model family, a different CLI). If you test RRS on
your own repos — especially with a different model or after a real multi-week pause —
open an issue with what worked and what the agent still had to guess. That feedback
shapes v0.3.

This repo is itself built to the standard (it has its own `START_HERE.md` / `STATE.md`).
It is its own first example.
