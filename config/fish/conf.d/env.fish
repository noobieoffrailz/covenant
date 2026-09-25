set -gx XDG_CONFIG_HOME $HOME/.config

switch (hostname -s)
    case Upbook
        set -gx HOMEBREW_PROFILE upbook
    case Compooter
        set -gx HOMEBREW_PROFILE compooter
end
