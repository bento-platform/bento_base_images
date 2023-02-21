ARG BENTO_NODE_VERSION
ARG BENTO_NODE_DEBIAN_VERSION

FROM node:${BENTO_NODE_VERSION}-${BENTO_NODE_DEBIAN_VERSION}

LABEL Maintainer="Bento Project"

# Install Bash for nicer entrypoints + utility scripts
# gosu is for switching into a non-root UID/GID cleanly in the base image entrypoint
RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y bash gosu; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./resources/set_gitconfig.bash .
COPY ./resources/create_service_user.bash .
COPY ./resources/gosu_entrypoint.bash .
RUN chmod +x ./gosu_entrypoint.bash

ENTRYPOINT ["/gosu_entrypoint.bash"]
