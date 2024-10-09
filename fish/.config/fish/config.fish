if status is-interactive
    # FZF CONFIG
    fzf --fish | source

    # export FZF_DEFAULT_COMMAND="fd -H"
    # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # export FZF_ALT_C_COMMAND="fd -t d -H . $HOME"
end
