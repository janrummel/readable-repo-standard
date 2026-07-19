# Cross-harness replication (Codex CLI / GPT-5.4)

Date: 2026-07-19. This closes the "same model family" limitation that every prior
run carried: the v2 A/B was replicated with a different model family in a different
harness, operated by the project owner by hand (no Claude in the loop during runs).

## Setup

- Harness: OpenAI Codex app/CLI, fresh ephemeral session per run, read-only sandbox,
  no approvals, no custom instructions (global AGENTS.md empty).
- Model: GPT-5.4 (owner's default Codex configuration).
- Arms: disposable copies of `../arm-a-bare` (as `test-1`) and `../arm-b-rrs`
  (as `test-2`), neutral folder names, ground truth kept outside the folder tree.
- Prompt: `PROMPT.txt` in this directory, identical for both arms. It asks for the
  project, the SINGLE most valuable next action, contributor constraints, files
  opened in order, and a self-confidence score. It does not hint at any metric.
- Order: Arm A before Arm B, two runs per arm.

## Raw runs

`codex-arm-a-run1.md`, `codex-arm-a-run2.md`, `codex-arm-b-run1.md`,
`codex-arm-b-run2.md` are the complete, unedited final responses.

Grading against `../PREREGISTRATION-v2.md` lives in `../RESULTS-v2.md`
(section "Cross-harness replication").
