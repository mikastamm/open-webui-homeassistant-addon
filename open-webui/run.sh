#!/usr/bin/env bash
set -e

# If using bashio, source it for convenience:
. /usr/lib/bashio/bashio.lib.sh

# Example: read config keys from /data/options.json
# If your config.yaml has:
#   schema:
#     use_cuda: bool
#     openai_api_key: str?
# then you can do:

USE_OLLAMA_DOCKER="true"
# You can also override upstream environment variables:
# e.g. export OLLAMA_BASE_URL="http://some-other-host:11434"

bashio::log.info "Launching Open-WebUI. use_cuda=$USE_CUDA01 openai_api_key length=${#OPENAI_API_KEY}"

# Finally, run the upstream start script or command
# Since upstream Dockerfile uses CMD ["bash", "start.sh"], 
# we can do something like:
exec bash /app/backend/start.sh
