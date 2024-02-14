ARG BENTO_PLAIN_DEBIAN_VERSION

FROM debian:${BENTO_PLAIN_DEBIAN_VERSION}

LABEL Maintainer="Bento Project"

# Install Bash for nicer entrypoints + utility scripts
# curl for healthchecks and debugging
# git is for getting git information for development/local repositories
# gosu is for switching into a non-root UID/GID cleanly in the base image entrypoint
# jq is for debugging
# procps is installed to provide ps, which can monitor active processes & get PIDs for debugging
# vim is for debugging
RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y bash curl git gosu jq procps vim; \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY ./resources/set_gitconfig.bash .
COPY ./resources/create_service_user.bash .
COPY ./resources/gosu_entrypoint.bash .
RUN chmod +x ./gosu_entrypoint.bash

ENTRYPOINT ["/gosu_entrypoint.bash"]
