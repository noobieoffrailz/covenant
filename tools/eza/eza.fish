set -l theme_file $XDG_CONFIG_HOME/eza/themes/$EZA_THEME.yml
if test -f $theme_file
    ln -sf $theme_file $XDG_CONFIG_HOME/eza/theme.yml
end

alias l 'eza --long --icons --no-user -la'
alias ls 'eza --long --icons --no-user -la'
alias lt 'eza --tree --icons --no-user'
