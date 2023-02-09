#!/bin/bash

# Ensure gitconfig file exists before trying to write to it
touch ~/.gitconfig

if [[ -n "${BENTO_GIT_NAME}" || -n "${BENTO_GIT_EMAIL}" ]]; then
  echo "[user]" >> ~/.gitignore
  printf "\tname = %s\n" "${BENTO_GIT_NAME}" >> ~/.gitconfig
  printf "\temail = %s\n" "${BENTO_GIT_EMAIL}" >> ~/.gitconfig
fi

if [[ -n "${BENTO_GIT_REPOSITORY}" ]]; then
  echo "[safe]" >> ~/.gitconfig
  printf "\tdirectory = %s\n" "${BENTO_GIT_REPOSITORY}" >> ~/.gitconfig
fi
