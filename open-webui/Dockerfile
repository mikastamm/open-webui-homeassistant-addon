# File: Dockerfile
# This wrapper image starts from the pre-built image and adds
# the necessary Home Assistant labels and a custom startup script.

ARG BUILD_FROM
FROM ghcr.io/open-webui/open-webui:v0.6.2

# Labels for Home Assistant Supervisor
LABEL \
  io.hass.version="v0.6.2" \
  io.hass.type="addon" \
  io.hass.arch="aarch64|amd64"

# By default, expose the same port
EXPOSE 8080

ENV DATA_DIR=/data

COPY open-webui/run.sh .
RUN chmod a+x run.sh

# Run the wrapper script on startup
# CMD [ "/run.sh" ]
