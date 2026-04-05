# MEMORY.md

## User Preferences
- Compact answers first; add detail only when asked.
- Python-first data engineer at KKP.
- Preferred tooling: pnpm, biome, uv, ruff, Justfile, Podman, Kubernetes with Flux.
- Default database: PostgreSQL.
- Active PKM / Obsidian vault: `/srv/syncthing/obsidian-second-brain`.
- OpenClaw area notes live under `/srv/syncthing/obsidian-second-brain/2.Area/OpenClaw`.
- Interests: homelab, self-hosting, local LLMs, and trading bots.

## Workflow Preferences
- Use conventional commits.
- Plan and review centrally; delegate implementation when useful.
- Prefer Alice to manage sub-agents internally and report back directly, rather than switching the chat to another agent.
- When delegating, a brief status update about what Alice is doing is enough; no need to explain why every time.
- If Bank explicitly asks to talk to another agent, announce that the switch is happening before routing the conversation.
- On Telegram, only Alice may speak directly to Bank; all sub-agent work must stay behind the scenes and be reported back by Alice.
- For detailed sub-agent documents/proposals, automate a draft → review → revise loop with a maximum of 2 review/revision rounds, then summarize the result to Bank.
- Coding agent preference: Gemini 3 first; fallback to Claude Code (Sonnet).
- Bank expects Gemini to be used heavily for coding when usable, since quota is available there; fallback only when Gemini is actually unhealthy.
- Codex is primarily used as Runner / execution helper, not the default coding agent.
- Prefer Gemini 3 via Gemini CLI as the reviewer when that path is healthy.
- Fallback review order: Codex first, then Bank.
- After each ACP task finishes, verify the ACP session closed cleanly so stale sessions do not accumulate and exhaust the ACP session limit.
- Include short assignment/status lines when delegating so Bank can see which agent owns which task.
- Provide updates when assignments happen or progress changes.
- If Bank says he is going to sleep, hold proactive updates until he says he is back, then summarize all queued updates in one message.
- Keep AGENTS.md and memory artifacts lean to avoid unnecessary context/token usage.
- Use local models for secret-adjacent config, credential wiring, and validation.
- Cloud models should only see variable names, not plaintext secrets.

## Security Rules
- Never hardcode secrets.
- Prefer 1Password references, env vars, or secret managers.
- `MEMORY.md` is main-session-only context.
- Live config belongs in `~/.openclaw/openclaw.json`.

## Active Projects
- Mission Control: Phase 1 building. Spec at `1. Project/Personal/P - Mission Control/`.
- Agent Architecture: spec at `1. Project/Personal/P - Agent Architecture/`.

## Watchlist
- Secure the OpenClaw web UI.
- Track Gemini ACP compatibility.
- Continue Mission Control gateway and Obsidian integrations.

## System Notes
- Host: `nuc-13-pro` with 30 GB RAM.
- Syncthing root: `/srv/syncthing`.
- Gateway is LAN-bound with token auth.
- Telegram is connected.
- Web UI and Telegram DM share the main session.
