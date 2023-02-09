ARG BENTO_NODE_VERSION
ARG BENTO_NODE_DEBIAN_VERSION

FROM node:${BENTO_NODE_VERSION}-${BENTO_NODE_DEBIAN_VERSION}

LABEL Maintainer="Bento Project"

# Install Bash for nicer entrypoints + utility scripts
RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y bash

WORKDIR /
COPY ./resources/set_gitconfig.bash .
