# How this repo is put together

A map of the whole thing, for anyone picking it up: what the parts are, which way they
depend on each other, and the three places where the obvious move is the wrong one.

For the working state, read [`STATE.md`](../STATE.md). This file describes the
architecture, never the status.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="../assets/overview-map-dark.png">
  <img src="../assets/overview-map-light.png" width="940"
       alt="A map of how this repository is put together, in four bands. Top band, the entry path: a blank model or a new person reads AGENTS.md, then START_HERE.md, then STATE.md, which is the only place that states the working status. Middle band, three columns. The rules: STANDARD.md, from which the templates are derived. The proof: the experiment folder with variants one, two and three, holding pre-registrations, results and raw runs, whose arms are frozen as evidence and must not be corrected. The shop window: README.md and the landing page, fed with images by the assets folder and its render script. Below the columns, one filled-in instance, the tidymark example, derived from the rules and copied in frozen form into the experiment as its substrate. The experiment supplies the numbers to the shop window. Bottom band, the self-reference: this repo applies the rules to itself, the same five files sit at its root as its memory rather than as an example, which loops back to the entry path.">
</picture>

## The five parts

| Part | Where | What it is |
|---|---|---|
| The rules | `STANDARD.md`, `templates/` | the standard itself, plus the same rules as empty forms to copy |
| The proof | `experiment/` | three variants of a pre-registered cold-start test, with frozen arms and raw runs. The largest part of the repo by file count |
| One instance | `example/tidymark/` | a small Markdown CLI, filled in to the rules. Doubles as the experiment's substrate |
| The shop window | `README.md`, `docs/index.html`, `assets/` | what a visitor sees, plus the sources the images are rendered from |
| This repo's own memory | `START_HERE.md`, `STATE.md`, `MANIFEST.md`, `GLOSSARY.md`, `AGENTS.md` | the same five files the standard asks for, applied here for real |

`companion/` is deliberately outside all of this: a v0.3 direction (a conformance linter,
a tracking proposer), currently a note and nothing else, kept separate so the core stays
tool-agnostic.

## Which way things depend on each other

Almost everything points one way, which is what keeps it maintainable:

- `STANDARD.md` → `templates/`: the same rules, emptied out. If a section name changes in
  the standard, the templates are wrong until they follow.
- `STANDARD.md` → `example/tidymark/`: one filled-in instance of the rules.
- `example/tidymark/` → `experiment/*/arm-*`: copied in, then **frozen**. The arms are the
  material the runs were performed on.
- `experiment/` → README, landing page, `STANDARD.md` status line: **every number on a
  public surface originates here.** Nothing else may invent one.
- `assets/*.html` → PNGs → README and landing page: images are rendered, never drawn by
  hand, via `assets/render.sh` (headless Chrome).
- everything → `STATE.md`: the working status is recorded there and nowhere else.

The entry path is the one thing that has to come from outside the repo: open
`AGENTS.md` or `START_HERE.md` first. From there the folder carries itself. That path is
exactly what the experiment measures.

## Three places where the obvious move is wrong

1. **Do not "fix" the frozen arms** under `experiment/v1/` and `experiment/v2/`. They contain
   known defects on purpose, because they are the artefacts the runs were performed on.
   Corrections belong in `example/tidymark/`, which is the living copy. This is the only
   place in the repo where inconsistency is the correct state.
2. **Do not edit one copy of a diagram.** The docking diagram and the evidence chart exist
   twice by design: as a render source in `assets/` and inline in `docs/index.html`. There
   is no build step, so the two are kept in sync by hand. Change both, then run
   `./assets/render.sh`.
3. **Do not put a number in the overview map.** It is deliberately free of scores, file
   counts and version numbers, so it only changes when the architecture changes. Every
   picture in this repo that carried a figure has drifted at least once.

## What there is not

No build step, no CI, no dependency manifest, no runtime. The only executable parts are
`assets/render.sh` and the small example program with its two tests. Everything else is
Markdown and one HTML page.

## Where to go next

- The rules themselves: [`STANDARD.md`](../STANDARD.md)
- Start your own repo: [`templates/`](../templates/)
- The evidence, including what it does not show: [`experiment/`](../experiment/)
- The working state of this project: [`STATE.md`](../STATE.md)
