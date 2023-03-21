ARG BENTO_PYTHON_VERSION
ARG BENTO_PYTHON_DEBIAN_VERSION

FROM python:${BENTO_PYTHON_VERSION}-${BENTO_PYTHON_DEBIAN_VERSION}

LABEL Maintainer="Bento Project"

SHELL ["/bin/bash", "-c"]

# Install base packages for later use when installing Python packages
# build-essential contains:
#  - dpkg-dev/g++/gcc/libc6-dev/make
# bash allows for better entrypoint scripting for some projects
# git is used to get tag/commit information, especially in development environments
# curl is used for talking to/waiting for other services, healthchecks, & for diagnosing issues
# gosu is for switching into a non-root UID/GID cleanly in the base image entrypoint
# procps is installed to provide ps, which can monitor active processes & get PIDs for debugging
# TODO: Find reasoning / use for each of these packages
# Set up a virtual environment for development images

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y \
            bash \
            build-essential \
            curl \
            git \
            gosu \
            libpq-dev \
            perl \
            procps; \
    rm -rf /var/lib/apt/lists/*; \
    pip install --no-cache-dir -U pip; \
    pip install --no-cache-dir poetry==1.4.1

WORKDIR /
COPY ./resources/set_gitconfig.bash .
COPY ./resources/create_service_user.bash .
COPY ./resources/gosu_entrypoint.bash .
COPY ./resources/poetry_user_install.bash .
RUN chmod +x ./*.bash

ENTRYPOINT ["/gosu_entrypoint.bash"]
