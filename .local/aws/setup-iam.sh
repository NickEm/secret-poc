#!/bin/bash

echo "Setting up AWS IAM ..."
export ENDPOINT="--endpoint-url=http://localhost:4566"

export USER_NAME="secret-poc-param-store"
echo "Creating [$USER_NAME] IAM user..."

aws "${ENDPOINT}" iam create-user --user-name ${USER_NAME}
aws "${ENDPOINT}" iam create-access-key --user-name ${USER_NAME}

aws "${ENDPOINT}" iam put-user-policy --user-name ${USER_NAME} \
  --policy-name "${USER_NAME}"-policy \
  --policy-document file:///var/lib/localstack/tmp/data/iam/1-param-store-policy.json


export USER_NAME="secret-poc-secret-manager"
echo "Creating [$USER_NAME] IAM user..."

aws "${ENDPOINT}" iam create-user --user-name ${USER_NAME}
aws "${ENDPOINT}" iam create-access-key --user-name ${USER_NAME}

aws "${ENDPOINT}" iam put-user-policy --user-name ${USER_NAME} \
  --policy-name "${USER_NAME}"-policy \
  --policy-document file:///var/lib/localstack/tmp/data/iam/2-secret-manager-policy.json


export USER_NAME="secret-poc-param-store-and-secret-manager"
echo "Creating [$USER_NAME] IAM user..."

aws "${ENDPOINT}" iam create-user --user-name ${USER_NAME}
aws "${ENDPOINT}" iam create-access-key --user-name ${USER_NAME}

aws "${ENDPOINT}" iam put-user-policy --user-name ${USER_NAME} \
  --policy-name "${USER_NAME}"-policy \
  --policy-document file:///var/lib/localstack/tmp/data/iam/3-param-store-and-secret-manager-policy.json

echo "Finished setting up IAM."
