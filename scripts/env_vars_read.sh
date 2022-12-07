#!/bin/sh
# scripts/env_vars_read.sh
# 2022-11-25 | CR
#
ENV_DIR="."
if [ -f "${ENV_DIR}/.env" ]; then
    set -o allexport; source "${ENV_DIR}/.env"; set +o allexport ;
else
    echo "ERROR: ${ENV_DIR}/.env file not found..."
fi
