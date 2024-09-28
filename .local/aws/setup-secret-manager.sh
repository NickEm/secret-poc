#!/bin/bash

echo "Setting up AWS Secrets Manager ..."

export ENDPOINT="--endpoint-url=http://localhost:4566"

aws "${ENDPOINT}" secretsmanager create-secret \
    --name "/prod/vault/shared/" \
    --secret-string file:///var/lib/localstack/tmp/data/secret/1-secret-shared.json

aws "${ENDPOINT}" secretsmanager create-secret \
    --name "/prod/vault/secret-manager-service/" \
    --secret-string file:///var/lib/localstack/tmp/data/secret/2-secret-service.json

echo "Finished setting up Secrets Manager."
