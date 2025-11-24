#!/bin/bash

# Only available in Python base images
# Do a `poetry install --with dev`-ish install with --user by exporting requirements
# See https://github.com/python-poetry/poetry-plugin-export?tab=readme-ov-file#usage
pip install poetry-plugin-export
poetry export -f requirements.txt --with dev --output requirements.txt
pip install --no-cache-dir --no-deps --user -r requirements.txt
rm requirements.txt
pip install -e .
