set -gx XDG_CONFIG_HOME $HOME/.config

# Repo root, resolved through the ~/.config/fish symlink
set -g CONFIG_DIR (path resolve (path dirname (status filename))/../../../..)

# Machine-specific settings: fish/machines/<hostname>.fish
set -l machines $XDG_CONFIG_HOME/fish/machines
source $machines/default.fish

set -l machine $machines/(hostname -s).fish
if test -f $machine
    source $machine
else if status is-interactive
    echo "unknown machine '"(hostname -s)"', add fish/machines/"(hostname -s)".fish"
end

set -q MACHINE_PROFILE; and set -gx HOMEBREW_PROFILE $MACHINE_PROFILE
