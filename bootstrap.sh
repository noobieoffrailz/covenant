#!/bin/sh
# New machine: ./bootstrap.sh  (asks for your password once, for sudo)
set -e
cd "$(dirname "$0")"

if [ ! -x /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

command -v ansible-playbook >/dev/null 2>&1 || brew install ansible

ansible-playbook ansible/site.yml --limit "$(hostname -s)" --ask-become-pass
