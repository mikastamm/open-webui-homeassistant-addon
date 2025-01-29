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

# Gather user options (with defaults)
if bashio::config.exists 'use_cuda'; then
    USE_CUDA01="$(bashio::config 'use_cuda')"
else
    USE_CUDA01="false"
fi

OPENAI_API_KEY="$(bashio::config 'openai_api_key')"
if [ -z "$OPENAI_API_KEY" ]; then
    OPENAI_API_KEY=""
fi

# Export them as environment variables so Python code or
# the original Docker entrypoint can see them
export USE_CUDA01
export OPENAI_API_KEY

# You can also override upstream environment variables:
# e.g. export OLLAMA_BASE_URL="http://some-other-host:11434"

bashio::log.info "Launching Open-WebUI. use_cuda=$USE_CUDA01 openai_api_key length=${#OPENAI_API_KEY}"

# Finally, run the upstream start script or command
# Since upstream Dockerfile uses CMD ["bash", "start.sh"], 
# we can do something like:
exec bash /app/backend/start.sh
