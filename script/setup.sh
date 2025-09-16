#!/bin/bash

SCRIPT_PATH=$(dirname "$0")

$SCRIPT_PATH/download-fabric.sh
$SCRIPT_PATH/setup-network.sh
$SCRIPT_PATH/generate-config.sh