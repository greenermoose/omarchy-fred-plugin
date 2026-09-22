# Session: 2026-09-22 — Immutable Plugin Test Snapshots and Human Authorship

- **CLI Tool**: `codex` (Codex CLI `0.155.1`)
- **Model**: GPT-5.6 Sol (`gpt-5.6-sol`)
- **Session**: `01a0ca42-8225-7ac2-a8b2-11fd6c0900aa`
- **Implementation Commit**: `121b0b928226`

## Prompts

> I want to be able to develop my plugins like fred.agents by editing the files in the local clone of the repo at ~/Code/omarchy-fred-agents and then running some command to put that version in the place where it will be used on my system. In other words, I want to be able edit my repo without those changes immediately affecting my running system, but then test them out and see how they work, and then be able to revert to a previous version if the changes are not good. Is that development process available to me now? If so, please step me through the commands I need to know in order to manage this process manually. Until now, I've been relying on AI agents to do all my coding. Now I want to try some manual coding sessions. Also, I want my AI to be smart enought that when I check in my work and then ask my AI to publish it, the AI can generate a session file that summarizes what I've done and notes that no AI was used for coding during the session.
>
> Ask if you have any questions about what I want to do and what I'm asking you to tell me and help me do.

> Yes

## Decisions and Implementation

- Added `omarchy-fred-plugin test <id>` for deploying an immutable snapshot
  from `~/Code/omarchy-fred-<name>` without coupling later editor saves to the
  running shell.
- The default snapshot captures the working tree, including uncommitted and
  untracked files except `.git`; a named Git ref uses `git archive`.
- The exact pre-test live plugin directory is preserved in the private state
  directory and restored by `test <id> off` without a Home Manager switch.
- `undo` swaps the current and previous test snapshots, allowing a quick A/B
  rollback. `status` reports the source, ref, commit, dirty state, and creation
  time of the running snapshot.
- Snapshot test mode and the older config-repository dev mode are mutually
  exclusive so neither can overwrite the other's recovery state.
- Updated the provenance skill and publish runbook to preserve Fred's
  human-authored commits, record “AI coding assistance: None — declared by
  Fred,” and put trailers only on separate commits containing actual AI work.

## Verification

- `bash -n` passed for the manager and integration test.
- The isolated integration test verified working-tree isolation, repeated
  deployment, bidirectional undo, status metadata, dev/test exclusion, named
  Git-ref deployment, invalid-ID rejection, and exact restoration by `off`.
- `shellcheck` was unavailable on the workstation; no package was installed.
