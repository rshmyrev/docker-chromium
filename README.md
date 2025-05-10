# Chromium Docker

## Configuration

The [Chromium](https://www.chromium.org/Home/) Docker container can be configured using environment variables and volumes.

### Environment Variables

- `DISPLAY`: X11 display server connection string.
- `PULSE_SERVER`: Path to PulseAudio server.

### Volumes

- `/tmp/.X11-unix:/tmp/.X11-unix:ro`: X11 socket for display forwarding.
- `$XDG_RUNTIME_DIR/pulse:$XDG_RUNTIME_DIR/pulse:ro`: PulseAudio.
- `chromium_home:/home/user`: Home directory.
- `$HOME/Downloads:/home/user/Downloads`: Downloads directory.

## Usage

### Docker Run

```bash
docker run -d \
  --name chromium \
  -e DISPLAY=${DISPLAY} \
  -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native \
  --device /dev/dri:/dev/dri \
  --cap-drop=ALL \
  --security-opt no-new-privileges=true \
  --shm-size=1g \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v ${XDG_RUNTIME_DIR}/pulse:${XDG_RUNTIME_DIR}/pulse:ro \
  -v chromium_home:/home/user \
  -v ${HOME}/Downloads:/home/user/Downloads \
  rshmyrev/chromium
```

### Docker Compose

```bash
docker compose up -d
```
