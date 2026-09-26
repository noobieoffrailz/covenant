#!/bin/bash
# Set up a fresh Mac from this repo.
#
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/noobieoffrailz/covenant/main/bootstrap.sh)" -- <MachineName>
#
# Before running: sign in to your Apple Account (also signs in to the App Store).
# Safe to run again; every step skips what is already done.
set -euo pipefail

REPO_URL="https://github.com/noobieoffrailz/covenant.git"
REPO_DIR="$HOME/Development/covenant"
NAME="${1:-}"

step() { printf '\n\033[1;35m==> %s\033[0m\n' "$1"; }

# 1. Homebrew (also installs Xcode Command Line Tools, which provide git)
step "Homebrew"
if [ ! -x /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. Repo (HTTPS: works before any SSH keys exist)
step "Repository → $REPO_DIR"
if [ ! -d "$REPO_DIR/.git" ]; then
    mkdir -p "$(dirname "$REPO_DIR")"
    git clone "$REPO_URL" "$REPO_DIR"
fi
cd "$REPO_DIR"

# 3. Machine name (must match a file in ansible/host_vars/)
step "Machine name"
known=$(ls ansible/host_vars | sed 's/\.yml$//' | tr '\n' ' ')
while [ -z "$NAME" ] || [ ! -f "ansible/host_vars/$NAME.yml" ]; do
    [ -n "$NAME" ] && echo "Unknown machine '$NAME'."
    echo "Known machines: $known"
    read -r -p "Machine name: " NAME
done
if [ "$(scutil --get LocalHostName 2>/dev/null)" != "$NAME" ]; then
    echo "Renaming this Mac to $NAME (sudo)"
    for key in ComputerName LocalHostName HostName; do
        sudo scutil --set "$key" "$NAME"
    done
fi

# 4. Packages (run here, not in Ansible: casks and App Store may ask for input)
step "Brewfile"
PROFILE=$(sed -n 's/^profile: *//p' "ansible/host_vars/$NAME.yml")
if ! HOMEBREW_PROFILE="$PROFILE" brew bundle --file=Brewfile; then
    echo "Some Brewfile entries failed (see above). Continuing; run 'brew bundle' again later."
fi

# 5. Everything else
step "Ansible (asks for your password once, for sudo)"
ansible-playbook ansible/site.yml --limit "$NAME" --ask-become-pass

# 6. Steps that need 1Password
step "1Password"
echo "Sign in to 1Password, then enable Settings → Developer → \"Integrate with 1Password CLI\"."
read -r -p "Press Enter to continue, or s to skip: " answer
if [ "$answer" = "s" ]; then
    echo "Skipped. Run later: ansible-playbook ansible/site.yml --limit $NAME --tags post-install"
else
    ansible-playbook ansible/site.yml --limit "$NAME" --tags post-install
fi

step "Done. Log out and back in, then follow the checklist in README.md"
