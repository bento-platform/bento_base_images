# Bento Base Images

PoC for automated Bento platform base image building and tagging.

## Motivation

The Bento platform has several services, most of whom depend on a common set
of base dependencies (ex. Python 3.x + Gunicorn).

The goal of this repository is to hold all specifications and workflows needed
to automatically build, tag, and distribute these base images.

It builds on the work done for 
[BentoV2](https://github.com/bento-platform/bentoV2).
