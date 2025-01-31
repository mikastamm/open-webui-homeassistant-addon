# File: Dockerfile
# This wrapper image starts from the pre-built image and adds
# the necessary Home Assistant labels and a custom startup script.

ARG BUILD_FROM
FROM ghcr.io/open-webui/open-webui:latest

# Labels for Home Assistant Supervisor
LABEL \
  io.hass.version="1.0.0" \
  io.hass.type="addon" \
  io.hass.arch="aarch64"

# (Optional) Install bashio if you want to parse /data/options.json easily
# For Alpine-based builds: RUN apk add --no-cache bash bashio
# For Debian-based builds:
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl jq \
    && curl -sL https://github.com/hassio-addons/bashio/archive/refs/tags/v0.14.3.tar.gz \
       | tar zx --strip 1 -C /tmp \
    && mv /tmp/lib /usr/lib/bashio \
    && rm -rf /var/lib/apt/lists/* /tmp/*

# Copy our custom script into the image
COPY open-webui/run.sh /run.sh
RUN chmod a+x /run.sh

# By default, expose the same port
EXPOSE 8080

# Run the wrapper script on startup
CMD [ "/run.sh" ]
