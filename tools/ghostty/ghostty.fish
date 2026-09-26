# Machine-specific Ghostty settings, loaded via `config-file = ?machine`
printf '%s\n' \
    "theme = $GHOSTTY_THEME" \
    "cursor-color = $GLOBAL_THEME_COLOR" >$XDG_CONFIG_HOME/ghostty/machine
