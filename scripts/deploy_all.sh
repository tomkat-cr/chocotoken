#!/bin/sh
# scripts/deploy_all.sh
# 2022-11-26 | CR
#
source scripts/env_vars_read.sh
TARGET_NETWORK="$1"
if [ "${TARGET_NETWORK}" = "" ]; then
    TARGET_NETWORK="localhost"
fi
npx hardhat run --network ${TARGET_NETWORK} scripts/deploy_ChocoToken.js
npx hardhat run --network ${TARGET_NETWORK} scripts/deploy_EIP712MessageCounter.js
