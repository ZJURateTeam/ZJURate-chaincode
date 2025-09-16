#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
ROOT_PATH=$SCRIPT_PATH/..

curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/install-fabric.sh -o $ROOT_PATH/install-fabric.sh && chmod +x install-fabric.sh
$ROOT_PATH/install-fabric.sh