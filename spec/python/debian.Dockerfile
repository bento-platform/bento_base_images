ARG BENTO_PYTHON_VERSION
ARG BENTO_DEBIAN_VERSION

FROM python:${BENTO_PYTHON_VERSION}-${BENTO_DEBIAN_VERSION}

LABEL Maintainer="Bento Project"

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y \
            build-essential \
            git \
            libpq-dev

RUN python -m pip install --upgrade pip
RUN python -m pip install gunicorn
