# Companion tooling (optional) — a v0.3 direction

> **This is not part of the standard.** The Readable Repo Standard is, and stays,
> framework-free and model-agnostic (see `STANDARD.md` §9). Nothing here is required for
> RRS conformance. This folder sketches *optional* tooling that helps humans and agents
> keep an RRS repo healthy. Adopt none, one, or all of it.

## Why a companion at all

RRS has one real failure mode: **discipline.** The four files only help if `STATE.md`
actually stays fresh. The experiment in `experiment/` showed the counterfactual directly:
project state that lived in the conversation simply evaporated. The standard removes the
*need* to guess; it does not, by itself, make anyone *write the state down*.

A companion attacks exactly that gap. It is the "enforcement over rules" layer.

## Two layers, increasing power and increasing coupling

### 1. Conformance linter (deterministic, tool-agnostic)
A plain script, runnable in any CI or pre-commit hook, that checks the mechanical rules:

- the four files + the `AGENTS.md` bridge exist at the root
- `STATE.md` names exactly one "next action"
- no status/"done" blocks live outside `STATE.md`
- no absolute self-paths (repo must survive copy/move)
- every term used is defined in `GLOSSARY.md`

This is cheap, precise, and couples to nothing but a shell. It is the natural first
companion and was already anticipated as a v0.2 candidate.

### 2. Tracking proposer (generative, harness-specific)
An agent-side helper that watches the work and **proposes** a `STATE.md` entry when it
detects a tracking-worthy moment:

- a decision was just made ("we chose X over Y because Z")
- something was deliberately parked (distinct from merely unfinished)
- a new constraint or dependency emerged
- a piece became "done" (and, for code, reproducible from repo inputs)

This is the more valuable layer, because it fixes the discipline gap at the moment state
is created rather than after it is lost. It is also the more dangerous one.

## The one rule that decides whether the proposer helps or harms

**Precision over recall. Propose, never auto-write.**

False positives are noise, and noise is exactly the trust erosion RRS exists to prevent.
A proposer that dumps low-confidence entries into `STATE.md` makes the memory less
trustworthy, not more. So:

- fire only on clear, high-signal moments (an explicit decision, a park, a new constraint)
- output a *suggested diff*, never a silent write; a human or the driving agent confirms
- stay quiet when unsure

## Boundary (read this before building anything here)

- The core standard must never depend on a companion. A repo with zero tooling and a
  hand-kept `STATE.md` is fully conformant.
- Companions are per-harness adapters (a Claude Code skill, a git hook, a linter binary).
  Keep each one clearly labeled as such, so the model-agnostic core claim stays clean.
- Status: **design direction for v0.3. Nothing here is built or validated yet.** The clean,
  measured result in `experiment/` is about the passive standard only.
