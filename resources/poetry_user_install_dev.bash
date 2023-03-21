#!/bin/bash

# Only available in Python base images
# Do a `poetry install --with dev`-ish install with --user by exporting requirements
poetry export -f requirements.txt --with dev --output requirements.txt
pip install --user -r requirements.txt
rm requirements.txt
pip install -e .
