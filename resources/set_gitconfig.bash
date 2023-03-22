#!/bin/bash

# Ensure gitconfig file exists and is blank before trying to write to it
rm -f ~/.gitconfig
touch ~/.gitconfig

if [[ -n "${BENTO_GIT_NAME}" || -n "${BENTO_GIT_EMAIL}" ]]; then
  echo "[/set_gitconfig.bash] Setting git user information: name=${BENTO_GIT_NAME}; email=${BENTO_GIT_EMAIL}"
  {
    echo "[user]";
    printf "\tname = %s\n" "${BENTO_GIT_NAME}";
    printf "\temail = %s\n" "${BENTO_GIT_EMAIL}";
  } >> ~/.gitconfig
fi

if [[ -n "${BENTO_GIT_REPOSITORY_DIR}" ]]; then
  echo "[/set_gitconfig.bash] Setting git safe directory = ${BENTO_GIT_REPOSITORY_DIR}"
  {
    echo "[safe]";
    printf "\tdirectory = %s\n" "${BENTO_GIT_REPOSITORY_DIR}";
  } >> ~/.gitconfig
fi
