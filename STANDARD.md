# The Readable Repo Standard (RRS) — v0.2

> A portable convention for building a project repo so that any blank LLM (no
> project-specific system prompt, no external memory) can read the folder,
> understand it, and **continue from the last state** without guessing.
>
> Guiding image: **the repo is the book; the model is only the pen.** The knowledge
> lives in the folder, not in the model and not in the chat. The pen is replaceable.

Status: v0.2. Validated by a pre-registered A/B experiment (see `experiment/`). On the
sharpened test, a bare repo scored 0/3 on the correct next action while an RRS repo
scored 3/3, with self-reported agent confidence of 82 vs 98 (medians, n=3 per arm). See
`experiment/` for the full protocol, raw runs, and honest limits.

---

## 0. The touchstone (what everything is measured against)

A repo is RRS-conformant exactly when a **fresh, isolated model** (this folder only,
no memory, no prior knowledge) can answer these five questions without guessing:

1. What is this?
2. Where do I stand?
3. What is the ONE next action?
4. What do I need for it?
5. What must I not do (confidentiality)?

Wherever it has to guess, the standard is violated. The touchstone is executable
(Section 6), not opinion.

---

## 1. The simplest interface: four files at the root

A docking model needs **one** external convention: "open `START_HERE.md` first."
Nothing more. From there the repo carries itself. Fixed names, fixed location (repo
root), so two different models expect the same page in the same place. That fixed
naming + fixed format is the protocol from which "mutual memory understanding"
emerges — not telepathy, just convention.

| File | Role | Must contain |
|---|---|---|
| **`START_HERE.md`** | The entry point. The first thing read. | (a) What is this (2-3 sentences). (b) A map of the repo. (c) Pointers to STATE / MANIFEST / GLOSSARY. (d) The confidentiality boundary. (e) The reach of continuability. (f) "How to continue" (one paragraph). |
| **`STATE.md`** | The memory. Single source of truth. | The ONE next action (at the top). Done / open / in progress. Decisions **with WHY**. Open threads. Status lives ONLY here. |
| **`MANIFEST.md`** | The dock declaration. | Which skills/tools/environment are needed to run AND to continue. Entry point. Which "houses" exist and where. Optional machine-readable header (YAML). |
| **`GLOSSARY.md`** | The vocabulary. | Every project-specific term/method defined once. Aliases bound (one thing = one name). No term is used in the repo before it is defined here. |

These four are the minimum. Everything else (subfolders, artifacts, code) hangs
below them and is mapped in START_HERE.

**Bridge file (v0.2): `AGENTS.md`.** Ecosystem tools increasingly look for an
`AGENTS.md` at the root. Add a three-line `AGENTS.md` that points to `START_HERE.md`.
No foreign tool searches for START_HERE on its own; the bridge makes RRS discoverable
by agents that follow the emerging `AGENTS.md` convention. (Validated: a foreign
model found the entry point immediately via this bridge.)

---

## 2. Human docs vs. docs that let a model continue

This is the crux, so it gets its own section.

- **A human** tolerates "you'll figure it out", asks follow-up questions, wants
  motivation and narrative.
- **A blank model** has no memory and no chance to ask at the moment it docks. Every
  gap is filled by **confabulation**. So model-facing docs must remove the need to
  guess: an explicit next action, defined terms, no dangling references, machine-
  findable (fixed names).
- **Both in one artifact:** the model constraints are layered ON TOP of good human
  docs; they do not contradict them. Good narrative up top (for the human) + fixed
  structure, explicit next step, defined vocabulary (for the model). The test of
  model-readiness: *could a blank model act without inventing anything?*

Doc conventions that make a repo self-explaining:

- **Document while you build, not after.** Every notable decision goes into STATE.md
  immediately, with its WHY. The WHY matters more than the WHAT: the WHAT is in the
  code/artifact, the WHY dies otherwise.
- **One thing, one name.** Aliases cost confidence (an unbound alias is a guessing game).
- **No term before its definition.** Jargon only if it is in the GLOSSARY.
- **No dangling references.** If a reference points out of the repo, START_HERE/
  MANIFEST must say what is behind the pointer and whether it is needed to continue.
- **Status in exactly one place.** Files do not declare their own "done/open" (that
  drifts). Completeness lives only in STATE.md.

---

## 3. STATE.md structure

Canonical sections, drawn from this fixed menu and kept in this order, so a second model
knows where to look:

`The ONE next action` / `Next` / `Done` / `Parked (with why)` / `Decisions (with why)` /
`Open` / `Context`.

Only `The ONE next action` and `Done` are required; include the others when they apply
(a repo with nothing parked omits `Parked`). A repo may add a domain section such as
`Constraints` after `Decisions`. The rule is fixed names in a fixed order, not that every
section is always present.

Always record decisions as (decision → why), so a successor does not accidentally
overturn them. **The parked distinction matters most:** a feature that is deliberately
deferred looks identical to an unfinished one unless STATE.md says otherwise. In the
experiment, this is exactly where bare repos failed: a blank model cannot tell "not
done yet, go finish it" from "deliberately parked, do not touch."

---

## 4. Snapshot discipline (git as a filmstrip)

- Every **commit** is a complete, frozen snapshot. The **history** is a filmstrip of
  dockable frames. **Branches** are parallel worlds.
- **Iron rule:** never freeze a state that would fail its own litmus test. STATE.md
  current, entry clear, terms defined. Otherwise the filmstrip becomes a reel of
  half-finished frames.
- A model works on a copy/branch, develops further, and only freezes a conformant
  snapshot at the end. That keeps the main line always dockable.
- **Repo-relative paths, never absolute self-references.** A self-explaining repo must
  survive copying, moving, and cloning. Say "this folder", not `~/path/...`.

---

## 5. Houses & the reach of continuability

Not every project may or should be self-contained (confidentiality deliberately
separates "shareable" from "internal"). Instead of forcing completeness, the repo
**declares its boundary honestly**:

- Which **houses** exist (e.g. shareable + internal), and where they live (MANIFEST).
- Per work thread: **fully continuable from here** or **needs house X**. So a docking
  model knows which claims are backed and which are "asserted, not checkable here"
  (and must not be built on as fact).
- Confidentiality is marked (inline warning + naming convention) and, where possible,
  technically separated (own folder, `.gitignore`), not just by discipline.

---

## 6. Litmus test protocol (self-verification)

1. Start a fresh model as a subagent, **isolated**: this folder only, no global
   memory, no prior knowledge. Do not follow references outside the folder; note them
   as gaps.
2. Task: dock, answer the five touchstone questions, cite the evidence file for each,
   and keep a ruthless friction log (what was searched/not found, where it guessed,
   what was ambiguous).
3. **Score each of the five questions individually** (v0.2), not one overall number.
   Separate objective criteria (runs / does not run, numbers exact) from self-report.
4. Sanitize the result into `tests/YYYY-MM-DD-<repo>.md`. Compare against the prior run.
5. **Pass threshold (v0.2 working proposal):** >=80% weighted AND no single question
   below 60%. Run each test twice and log the spread. The confidence jump between two
   snapshots is the actual proof, not a single absolute number.

---

## 7. Applying RRS to an existing repo (hard-won rules)

1. **STATE describes the snapshot it lives in, not a newer reality.** A STATE distilled
   from an external/living log but dropped into an older frame over-claims. Before
   freezing: is every artifact STATE calls "done/present" actually in the frame (or
   honestly declared as "in house X / another session")?
2. **Actively switch off existing status blocks.** Adding STATE is not enough; old
   "status" sections in the README etc. must be neutralized, or two drifting truths exist.
3. **Confidentiality markers must not contradict each other.** A file suffix used as an
   internal signal must not contradict the actual status.

Meta-lesson: the confidence jump measures **docking/meta quality** (what the standard
is responsible for). Read it separately from **content continuability**, which houses
and human-in-the-loop may deliberately cap. A value sitting at the honest boundary is
success, not a defect.

---

## 8. Code repos: the execution layer

A prose repo is continuable when you UNDERSTAND it. A code repo, additionally, only
when you can RUN it. Explainability != executability. For code repos, also mandatory:

1. **Dependency manifest**, even if the current piece uses only the standard library.
   The next piece almost certainly needs external libs; without a manifest a model has
   to guess them.
2. **Raw-data provenance in the repo.** The query/fetch that produced a `*_raw` artifact
   must be versioned. Otherwise "reproducible" means only "recomputable from the saved
   dump", not "re-collectable".
3. **Config for external services** (endpoint, parameters, rate limit, ToS, key
   handling). If the next step hangs on an unmade external decision, it is documented
   but not executable.
4. **Inter-piece interface specified, not just drawn.** The join/score contract (fields,
   keys, format) between stages must be buildable; a diagram is not enough.
5. **"Done" for a code piece** = code + data artifact + docs agree AND it is reproducible
   from repo inputs. Only then may STATE call it done.

---

## 9. What the standard does NOT require

- No particular framework, runtime, or tool. Just files + conventions.
- No completeness at any cost (see houses).
- No after-the-fact doc session. Docs emerge while building, or not at all.

**Exit / convergence criterion (v0.2):** if the surrounding ecosystem (e.g. a native
`AGENTS.md` + memory standard) eventually solves the rest, the hand-built layer should
reduce to "AGENTS.md + a STATE layer". RRS is scaffolding for a gap, not an end in itself.

---

## Appendix — Conformance checklist

- [ ] `START_HERE.md` at the root, fixed order, orients without duplicating
- [ ] `STATE.md` at the root, names the ONE next action, status only here
- [ ] `MANIFEST.md`: skills/tools/environment + houses declared
- [ ] `GLOSSARY.md`: every term defined, aliases bound
- [ ] `AGENTS.md` bridge points to START_HERE
- [ ] Decisions with WHY, captured while building
- [ ] Parked items marked as deliberate, distinct from unfinished ones
- [ ] No dangling references without explanation; reach of continuability declared
- [ ] Confidentiality marked + technically separated where possible; markers do not conflict
- [ ] Self-references repo-relative (survive copy/move)
- [ ] STATE describes the actual folder contents (no over-claim from an external log)
- [ ] No competing status blocks outside STATE.md
- [ ] Litmus test run, result in `tests/`, threshold met, spread logged
- [ ] Snapshot passes its own litmus test before it is frozen
- [ ] (Code repo) dependency manifest + raw-data provenance + external-service config
- [ ] (Code repo) inter-piece interface specified; "done" = reproducible from repo inputs
