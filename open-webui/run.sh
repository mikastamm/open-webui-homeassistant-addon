#!/usr/bin/env bash
set -e

# If using bashio, source it for convenience:
. /usr/lib/bashio/bashio.lib.sh

# Read configuration options
USE_OLLAMA_DOCKER="true"
DATA_DIR=/data
WEBUI_SECRET_KEY=$(bashio::config 'webui_secret_key')
WEBUI_URL=$(bashio::config 'webui_url')
ENABLE_ADMIN_EXPORT=$(bashio::config 'enable_admin_export')
ENABLE_ADMIN_CHAT_ACCESS=$(bashio::config 'enable_admin_chat_access')
OFFLINE_MODE=$(bashio::config 'offline_mode')

# Export environment variables
export USE_OLLAMA_DOCKER
export DATA_DIR
export WEBUI_SECRET_KEY
export WEBUI_URL
export ENABLE_ADMIN_EXPORT
export ENABLE_ADMIN_CHAT_ACCESS
export OFFLINE_MODE

# Log the configurations
bashio::log.info "Launching Open-WebUI with the following configurations:"
bashio::log.info "DATA_DIR=${DATA_DIR}"
bashio::log.info "WEBUI_SECRET_KEY=[ommitted]"  # Mask secret key
bashio::log.info "WEBUI_URL=${WEBUI_URL}"
bashio::log.info "ENABLE_ADMIN_EXPORT=${ENABLE_ADMIN_EXPORT}"
bashio::log.info "ENABLE_ADMIN_CHAT_ACCESS=${ENABLE_ADMIN_CHAT_ACCESS}"
bashio::log.info "OFFLINE_MODE=${OFFLINE_MODE}"

# Finally, run the upstream start script or command
exec bash /app/backend/start.sh
