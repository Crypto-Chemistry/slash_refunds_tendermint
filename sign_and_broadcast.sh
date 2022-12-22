#!/bin/bash

for i in $(ls /tmp/dist*); do
        echo "Processing $i"
        secretcli tx sign $i --from slash_refund -ojson --output-document ~/dist_signed.json --node https://secretnetwork-rpc.stakely.io:443 --chain-id secret-4
        sleep 2
        secretcli tx broadcast ~/dist_signed.json --node https://secretnetwork-rpc.stakely.io:443 --chain-id secret-4
done
