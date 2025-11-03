#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${REPO_DIR:-$(pwd)}/"

if ! command -v ansible >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    brew install ansible
  elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y ansible
  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y ansible
  else
    echo "Install ansible first (brew/apt/dnf)."
    exit 1
  fi
fi

ANSIBLE_DIR="${REPO_DIR}/ansible"
INVENTORY="${ANSIBLE_DIR}/hosts.ini"
PLAYBOOK="${ANSIBLE_DIR}/site.yml"

ansible-playbook -i "${INVENTORY}" "${PLAYBOOK}" --ask-become-pass || ansible-playbook -i "${INVENTORY}" "${PLAYBOOK}"
