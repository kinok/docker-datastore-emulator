#!/usr/bin/env bash

echo "Creating ${DATA_DIR}"
mkdir "${DATA_DIR}"

source /root/.bashrc

echo "Updating emulator to lastest version..."
/root/google-cloud-sdk/bin/gcloud components update --quiet

DATAFLAG=""
if [ "$FULL_MEMORY" = "true" ]; then
    DATAFLAG="--no-store-on-disk"
fi

echo "Starting emulator..."
/root/google-cloud-sdk/bin/gcloud beta emulators datastore start --data-dir "${DATA_DIR}" --host-port "0.0.0.0:${HOST_PORT}" $DATAFLAG