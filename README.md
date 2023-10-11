# Chromium Docker

## Configuration

The [Chromium](https://www.chromium.org/Home/) Docker container can be configured using environment variables and volumes.

### Environment Variables

- `DISPLAY`: X11 display server connection string (e.g., `unix$DISPLAY`).
- `PULSE_SERVER`: path to PulseAudio server (e.g. `unix:$XDG_RUNTIME_DIR/pulse/native`).

### Volumes

- `/tmp/.X11-unix:/tmp/.X11-unix:ro`: X11 socket for display forwarding.
- `$XDG_RUNTIME_DIR/pulse:$XDG_RUNTIME_DIR/pulse:ro`: PulseAudio.
- `/run/dbus:/run/dbus:ro`: D-Bus.
- `chromium_home:/home/user`: home directory.
- `$HOME/Downloads:/home/user/Downloads`: Downloads directory.

## Usage

### Docker run

```bash
docker run -d \
  --name chromium \
  -e DISPLAY=unix${DISPLAY} \
  -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
  --device /dev/dri:/dev/dri \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v ${XDG_RUNTIME_DIR}/pulse:${XDG_RUNTIME_DIR}/pulse:ro \
  -v /run/dbus:/run/dbus:ro \
  -v chromium_home:/home/user \
  -v ${HOME}/Downloads:/home/user/Downloads \
  rshmyrev/chromium
```

### Docker compose

```bash
docker compose up -d
```
