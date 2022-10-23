ARG BENTO_PYTHON_ALPINE_BASE_VERSION
FROM quay.io/c3genomics/bento-common-alpine-python:${BENTO_PYTHON_ALPINE_BASE_VERSION} as builder

LABEL Maintainer="Bento Project"

# updates
RUN apk update && \
    apk upgrade

# note: Nuitka standalone mode on Linux requires 'patchelf' to be installed
RUN apk add patchelf 

# install single-python-executable-build dependencies
RUN pip install Nuitka==1.1.2 waitress==2.1.2