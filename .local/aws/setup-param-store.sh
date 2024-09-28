#!/bin/bash

echo "Setting up AWS Param Store ..."
export ENDPOINT="--endpoint-url=http://localhost:4566"

aws "${ENDPOINT}" ssm put-parameter --type "SecureString" \
    --name "/prod/vault/shared/service.datasource.username" \
    --value "USERNAME-from-SHARED-param-store"

aws "${ENDPOINT}" ssm put-parameter --type "SecureString" \
    --name "/prod/vault/shared/service.datasource.password" \
    --value "PASSWORD-from-SHARED-param-store"

aws "${ENDPOINT}" ssm put-parameter --type "SecureString" \
    --name "/prod/vault/param-store-service/service.datasource.username" \
    --value "USERNAME-from-SERVICE-param-store"

aws "${ENDPOINT}" ssm put-parameter --type "SecureString" \
    --name "/prod/vault/param-store-service/service.datasource.password" \
    --value "PASSWORD-from-SERVICE-param-store"

echo "Finished setting up Param Store."
