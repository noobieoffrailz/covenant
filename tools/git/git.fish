# Link this machine's git identity as the default (see [include] in .gitconfig)
set -l profiles $XDG_CONFIG_HOME/git/profiles
if set -q MACHINE_PROFILE; and test -f $profiles/$MACHINE_PROFILE.profile
    ln -sfn $MACHINE_PROFILE.profile $profiles/machine.profile
end
