#!/bin/bash
set -ex
PROFILE_PATH="${HOME}/.profile.d"

link_dotfiles_in() {
  local dotfile path
  for dotfile in "$1"/dotfiles/* ; do
    path="${HOME}/.$(basename ${dotfile})"
    [[ -e "${path}" ]] && rm -ri "${path}"
    ln -s "${dotfile}" "${path}"
  done
}

for path in \
    "${PROFILE_PATH}/users/${USER}" \
    "${PROFILE_PATH}/users/${USER}/${PLATFORM}"
do
    link_dotfiles_in "${path}"
done
