# Bento Base Images

Repository for automated Bento platform base image building and tagging.


## Motivation

The Bento platform has several services, most of whom depend on a common set
of base dependencies (ex. Python 3.x + Poetry + Gunicorn).

The goal of this repository is to hold all specifications and workflows needed
to automatically build, tag, and distribute these base images.


## Configuring container build environments

Container operating system and Python versions are configured using `env`
parameters in the 
[build.yml GitHub Actions workflow](.github/workflows/build.yml).
