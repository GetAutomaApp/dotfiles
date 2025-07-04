#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <secret_name_1> <secret_name_2> ..."
  exit 1
fi

for secret_name in "$@"; do
  echo "Pulling secret: $secret_name"
  secret_id=$(zv search -k "$secret_name" --output json | jq -r '.[0].secretid')

  if [ -z "$secret_id" ] || [ "$secret_id" == "null" ]; then
    echo "Error: Secret not found: $secret_name"
    continue
  fi

  zv get -id "$secret_id" --output json | jq -r '.secret.secretData[0].value' >"$secret_name"
  if [ $? -eq 0 ]; then
    echo "Successfully pulled and saved secret: $secret_name"
  else
    echo "Error: Failed to pull secret: $secret_name"
  fi
done
