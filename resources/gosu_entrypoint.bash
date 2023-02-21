#!/bin/bash

# If set, use the local UID from outside the container (or default to 1000)
USER_ID=${BENTO_UID:-1000}

echo "[bento_base_image] [entrypoint] starting with USER_ID=${USER_ID}"

# Add the user
useradd --shell /bin/bash -u "${USER_ID}" --non-unique -c "Bento container user" -m bento_user
export HOME=/home/bento_user

# Drop into bento_user from root and execute the CMD specified for the image
exec gosu bento_user "$@"
