#!/bin/bash

source /create_service_user.bash

# Drop into bento_user from root and execute the CMD specified for the image
exec gosu bento_user "$@"
