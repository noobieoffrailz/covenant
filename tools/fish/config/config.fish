for tool in brew mise bat eza ghostty git herdr lazygit nvim omp zoxide
    set -l file $CONFIG_DIR/tools/$tool/$tool.fish
    test -f $file; and source $file
end
