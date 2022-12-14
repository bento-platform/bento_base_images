ARG BENTO_PYTHON_VERSION
ARG BENTO_DEBIAN_VERSION

FROM python:${BENTO_PYTHON_VERSION}-${BENTO_DEBIAN_VERSION}

LABEL Maintainer="Bento Project"

# Install base packages for later use when installing Python packages
# build-essential contains:
#  - dpkg-dev/g++/gcc/libc6-dev/make
# bash allows for better entrypoint scripting for some projects
# git is used to get tag/commit information, especially in development environments
# TODO: Find reasoning / use for each of these packages
RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y \
            bash \
            build-essential \
            git \
            libpq-dev \
            perl

RUN python -m pip install --upgrade pip
RUN python -m pip install gunicorn
