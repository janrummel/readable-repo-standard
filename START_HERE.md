# START HERE — Readable Repo Standard

> You are reading the entry point of the Readable Repo Standard (RRS) repo. This repo
> is itself built to the standard it defines (dogfooding): it is its own first example.

## What this is
RRS is a portable convention for building a project repo so that any blank AI agent can
read the folder, understand it, and continue from the last state without guessing. See
`README.md` for the pitch and `STANDARD.md` for the full spec.

## Map of the repo
- `README.md` — the public pitch, the evidence, and the "try it yourself" guide.
- `STANDARD.md` — the full standard (v0.2). READ THIS to understand the actual rules.
- `STATE.md` — the working state of THIS repo. Done / next / parked / decisions.
- `GLOSSARY.md` — RRS terms.
- `MANIFEST.md` — environment and houses.
- `AGENTS.md` — the bridge for docking agents.
- `templates/` — copy-paste starting points for the four files + the bridge.
- `example/tidymark` — a small worked example built to the standard.
- `experiment/` — the pre-registered A/B test, raw runs, and results (v1 and v2).

## Confidentiality
Everything in this repo is public and synthetic. No confidential content, no real
names, no internal data. Safe to share.

## How to continue
Open `STATE.md`, take the ONE next action named there, do it, update `STATE.md`, and
freeze a snapshot that would pass its own litmus test.
