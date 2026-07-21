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
- `experiment/` — the pre-registered A/B test, the graded runs, and results (v1 to v3).
- `companion/` — optional, harness-specific tooling. A v0.3 direction, outside the core.
- `docs/overview.md` — **the map of this repo**: the parts, which way they depend on
  each other, and the three places where the obvious move is the wrong one.
- `docs/index.html` — the landing page (GitHub Pages).
- `assets/` — the image sources (docking diagram, evidence chart, overview map, link
  preview) plus `render.sh`, which renders them. Never edit the PNGs by hand.
- `LICENSE` — MIT.

## Confidentiality
Everything in this repo is public and synthetic. No confidential content, no real
names, no internal data. Safe to share.

## Reach of continuability
Fully continuable from here. Single house: everything needed to understand and extend
the standard is in this folder.

## How to continue
Open `STATE.md`, take the ONE next action named there, do it, update `STATE.md`, and
freeze a snapshot that would pass its own litmus test.
