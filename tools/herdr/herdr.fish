set -l path $XDG_CONFIG_HOME/herdr
set -l target $path/config.toml
set -l template $path/config.template.toml

if test -f $template
    set -l content (string replace -a '{{ACCENT}}' $GLOBAL_THEME_COLOR < $template | string collect)
    if not test -f $target; or test "$content" != "$(string collect < $target)"
        printf '%s\n' $content > $target
    end
end
