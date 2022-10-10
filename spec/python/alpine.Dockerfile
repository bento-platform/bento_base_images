ARG BENTO_PYTHON_VERSION
ARG BENTO_ALPINE_VERSION

FROM python:${BENTO_PYTHON_VERSION}-${BENTO_ALPINE_VERSION}

LABEL Maintainer="Bento Project"

RUN apk update; \
	apk upgrade; \
	apk add --no-cache --virtual \
		autoconf \
		automake \
		bash \
		build-base \
		bzip2-dev \
		cargo \
		curl \
		curl-dev \
		gcc \
		git \
		libcurl \
		libressl-dev \
		libffi-dev \
		linux-headers \
		make \
		musl-dev \
		openssl-dev \
		postgresql-dev \
		postgresql-libs \
		perl \
		xz-dev \
		yaml-dev \
		zlib-dev

RUN python -m pip install --upgrade pip
RUN python -m pip install gunicorn
