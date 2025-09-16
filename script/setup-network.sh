#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
ROOT_PATH=$(realpath $SCRIPT_PATH/..)
FABRIC_PATH=$ROOT_PATH/fabric-samples

cd $FABRIC_PATH/test-network
./network.sh down
./network.sh up createChannel -c mychannel -ca
./network.sh deployCC -ccn review -ccp $ROOT_PATH/src -ccl go -ccep "OR('Org1MSP.peer')" -cci InitLedger

mkdir -p "$ROOT_PATH/wallet/org1/tlscacerts"
cp "$FABRIC_PATH/test-network/organizations/peerOrganizations/org1.example.com/tlsca/tlsca.org1.example.com-cert.pem" \
   "$ROOT_PATH/wallet/org1/tlscacerts/tls-peer-ca.pem"

cp "$FABRIC_PATH/test-network/organizations/fabric-ca/org1/ca-cert.pem" \
   "$ROOT_PATH/wallet/org1/tlscacerts/tls-ca-cert.pem"