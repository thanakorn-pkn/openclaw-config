# BOOT.md

When the gateway starts, check `runtime/restart-state.json`.
- If it indicates a pending resume/restart state, send Bank: `OpenClaw gateway restarted and is back online.` Then clear the restart state so it only fires once.
- Otherwise, send Bank: `OpenClaw gateway is online.`
Then reply with `NO_REPLY`.
