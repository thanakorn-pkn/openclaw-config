#!/usr/bin/env bash
set -euo pipefail

openclaw message send --channel telegram --target 6538865360 --message "OpenClaw gateway is restarting now."
openclaw gateway restart
