# GLOSSARY — Readable Repo Standard

- **RRS (Readable Repo Standard)** — the convention defined in `STANDARD.md`: four root
  files + a bridge that make a repo continuable by a blank AI agent.
- **blank / cold agent** — a fresh model with no memory of the project and no context
  beyond the folder itself. The standard's target reader.
- **dock / andocken** — the act of a blank agent reading a repo and orienting itself to
  the point where it can act without guessing.
- **touchstone** — the five questions in Section 0 that a conformant repo must let a
  blank agent answer without guessing.
- **litmus test** — the executable check (Section 6): run a fresh isolated agent, score
  the five questions, log the friction and the confidence.
- **snapshot** — a complete, frozen git commit that would itself pass the litmus test.
- **house** — a physically separate location a project may span (e.g. shareable vs.
  internal); declared in MANIFEST so a docking model knows what is checkable here.
- **parked** — a task deliberately deferred with a recorded reason; distinct from merely
  unfinished. The distinction is what a bare repo cannot convey.
- **confabulation** — the gap-filling guessing a blank model does when a repo is
  under-specified; the thing the standard exists to eliminate.
