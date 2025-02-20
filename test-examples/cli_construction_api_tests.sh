#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "please input correct network for construction api tests" >&2
    exit 1
fi

if [ "$1" = "mainnet" ]; then
    export RPCURL=https://prod-mainnet.prod.findora.org:8545
elif [ "$1" = "anvil" ]; then
    export RPCURL=https://prod-testnet.prod.findora.org:8545
elif [ "$1" = "qa02" ]; then
    export RPCURL=https://dev-qa02.dev.findora.org:8545
elif [ "$1" = "prinet" ]; then
    export RPCURL=http://127.0.0.1:8545
else 
    echo "please input corret network"
    exit 1
fi

export http_proxy=
export https_proxy=

rm -rf test-cli
mkdir -p test-cli/rosetta-data
export ROSETTA_CONFIGURATION_FILE=rosetta-cli-conf/$1/config.json
rosetta-cli check:construction
