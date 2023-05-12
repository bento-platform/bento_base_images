#!/bin/bash

# If set, use the local UID from outside the container (or default to 1000)
USER_ID=${BENTO_UID:-1000}

echo "[/create_service_user.bash] using USER_ID=${USER_ID}"

# Add the user
useradd --shell /bin/bash -u "${USER_ID}" --non-unique -c "Bento container user" -m bento_user
export HOME=/home/bento_user

# Set up the path to include installed module Python scripts
echo 'PATH=/home/bento_user/.local/bin/:$PATH' >> /home/bento_user/.bashrc
