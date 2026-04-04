# OpenClaw Config

This private repository intentionally tracks only stable operator-managed config
from `~/.openclaw`.

Tracked files:

- `openclaw.json`
- `cron/jobs.json`

Ignored on purpose:

- credentials, auth stores, and `.env`
- session transcripts, memory indexes, logs, media, and task databases
- device state, Telegram state, and exec approvals
- all `workspace*` directories, which are versioned separately

This follows the OpenClaw docs split between workspace git backup and
`~/.openclaw` state/config, which can contain secrets and private data.
