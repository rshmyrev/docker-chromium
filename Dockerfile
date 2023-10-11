FROM alpine:latest
LABEL maintainer="rshmyrev <rshmyrev@gmail.com>"

# Install Chromium
RUN apk --no-cache --no-progress upgrade && apk add --no-cache \
    chromium \
    pulseaudio \
    pulseaudio-alsa

# Create a user
RUN adduser -D user

VOLUME ["/home/user"]
WORKDIR /home/user
USER user
ENTRYPOINT ["/usr/bin/chromium", "--no-sandbox"]
