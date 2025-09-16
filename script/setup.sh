#!/bin/bash

SCRIPT_PATH=$(dirname "$0")

./download-fabric.sh
./setup-network.sh
./generate-config.sh