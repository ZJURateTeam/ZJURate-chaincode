#!/bin/bash
set -euo pipefail

SCRIPT_PATH=$(dirname "$0")
ROOT_PATH=$(realpath "$SCRIPT_PATH/..")
FABRIC_PATH=$ROOT_PATH/fabric-samples

CONFIG_FILE="$ROOT_PATH/config.yaml"

# 替换 CA TLS 根证书路径
sed -i "s|^\(\s*tlsCACert:\).*|\1 \"$FABRIC_PATH/test-network/organizations/fabric-ca/org1/ca-cert.pem\"|" "$CONFIG_FILE"

# 替换 client homeDir
sed -i "s|^\(\s*homeDir:\).*|\1 \"$ROOT_PATH/wallet/org1\"|" "$CONFIG_FILE"

# 替换 peer tls CA 证书路径
sed -i "s|^\(\s*tlsCACertPath:\).*|\1 \"$FABRIC_PATH/test-network/organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem\"|" "$CONFIG_FILE"

echo "已更新 $CONFIG_FILE 中的路径"
