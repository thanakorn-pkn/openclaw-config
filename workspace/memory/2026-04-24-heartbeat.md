# 2026-04-24 — Heartbeat Check

- Read workspace `HEARTBEAT.md` and checked current Paperclip state.
- Verified `build-podman.sh` and `start-paperclip.sh` are syntactically valid.
- Updated `build-podman.sh` to use the current host UID/GID by default instead of hardcoding `1000`.
- Updated `scripts/docker-entrypoint.sh` to always normalize `/paperclip` ownership for the runtime user.
- Confirmed `pnpm dev:once` exists in the repo and a dev service is already running (`paperclip-dev-once` on http://127.0.0.1:3100 via `pnpm dev:list`).
- `podman` and `pnpm` are installed and usable.
- Container build smoke check completed successfully: `localhost/paperclip:latest` built with Podman.
- Runtime smoke now passes on both named volume and bind mount when `BETTER_AUTH_SECRET` is set in authenticated mode, and the server serves `http://127.0.0.1:3103/api/health` / `http://127.0.0.1:3104/api/health` successfully.
- Latest host-unresponsive investigation points to an OOM cascade on 2026-04-24: `prometheus` was killed at 09:24, `grafana` at 09:26, and `openclaw-gateway` at 09:27; later the host entered repeated memory pressure, k3s API timeouts, and a final wave of OOM kills around 17:30 before reboot.
- `apt-daily.service` also consumed 1h 50m CPU during the same boot, likely worsening pressure.
- Current post-reboot state is healthy again: ~6.5 GiB / 30 GiB used, low load, and `paperclip-db` is healthy.
- Found the Flux repo for the monitoring work: `/home/tphat/projects/homelab-infra`.
- Current homelab-infra worktree already has resource-limit edits in progress for `kube-prometheus-stack` plus host firewall entries for Multica.
- Validated the edited YAML files with `git diff --check` and a `python3` YAML parse check; both pass.
- I could not query live k3s state from this session because elevated access is unavailable here, so the next live-cluster verification step is currently blocked.
- Latest async build run finished cleanly and produced `localhost/paperclip:latest` (`6ab8d23850ee...`), so the current Paperclip container path is still green.
