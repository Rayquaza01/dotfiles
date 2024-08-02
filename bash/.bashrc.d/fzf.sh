#!/bin/bash
if [[ -f "/usr/share/fzf/shell/key-bindings.bash" ]]; then
    source /usr/share/fzf/shell/key-bindings.bash
fi

export FZF_DEFAULT_COMMAND="fd -H --no-require-git ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d -H --no-require-git . $HOME"
