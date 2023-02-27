#!/bin/bash

source /create_service_user.bash

# If we have set up a Python virtual environment for dependencies,
# fix up the permissions before switching user.
if [[ -d /env ]]; then
  chown -R bento_user:bento_user /env
fi

# Drop into bento_user from root and execute the CMD specified for the image
exec gosu bento_user "$@"
