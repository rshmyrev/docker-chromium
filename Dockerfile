FROM debian:testing-slim
LABEL maintainer="rshmyrev <rshmyrev@gmail.com>"

ARG DEBIAN_FRONTEND=noninteractive

# Install required deps and Chromium
RUN apt-get update && apt-get install -y --no-install-recommends \
      chromium \
      fonts-lato \
      fonts-quicksand \
      fonts-symbola \
      libegl1 \
      libgl1 \
      libpulse0 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Create a user
RUN useradd user

VOLUME ["/home/user"]
USER user
WORKDIR /home/user
ENTRYPOINT ["/usr/bin/chromium", "--no-sandbox"]
