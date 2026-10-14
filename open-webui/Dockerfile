# File: Dockerfile
# This wrapper image starts from the pre-built image and adds
# the necessary Home Assistant labels and a custom startup script.

ARG BUILD_FROM
FROM ghcr.io/open-webui/open-webui:v0.12.0

# Labels for Home Assistant Supervisor
LABEL \
  io.hass.version="v0.12.0" \
  io.hass.type="addon" \
  io.hass.arch="aarch64|amd64"

# By default, expose the same port
EXPOSE 8080

ENV DATA_DIR=/data
# Keep the session signing key in /data so logins survive add-on restarts
ENV WEBUI_SECRET_KEY_FILE=/data/.webui_secret_key

COPY open-webui/run.sh .
RUN chmod a+x run.sh

# Run the wrapper script on startup
# CMD [ "/run.sh" ]
