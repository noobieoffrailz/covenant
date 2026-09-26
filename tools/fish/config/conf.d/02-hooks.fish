if status is-interactive
    function __newline_before_command --on-event fish_preexec
        echo
    end
end
