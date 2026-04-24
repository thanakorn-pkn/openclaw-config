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
- Found the Flux repo for the monitoring work: `ssh://git@github.com/thanakorn-pkn/homelab-infra.git`.
- Tightened the remaining local OOM protections on the host: `paperclip-db.container` now has `MemoryMax=256M`, and user service limits are loaded for `openclaw-gateway`, `hermes-gateway`, and `paperclip-db`.
- Latest async build run finished cleanly and produced `localhost/paperclip:latest` (`6ab8d23850ee...`), so the current Paperclip container path is still green.
