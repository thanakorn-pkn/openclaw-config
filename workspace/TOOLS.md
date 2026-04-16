# TOOLS.md

- Host: `nuc-13-pro` (30 GB RAM)
- Primary cloud model: `openai-codex/gpt-5.4`
- Local fallback model: `ollama/qwen3.5:9b`
- ACP agents available: `codex`, `claude`, `gemini`, `opencode`, `hermes`
- `hermes` — autonomous multi-step tasks (terminal + file + web in one loop); command: `hermes acp`
- Gateway service: `systemctl --user restart openclaw-gateway.service`
- OpenClaw CLI: `/data/pnpm/openclaw`
