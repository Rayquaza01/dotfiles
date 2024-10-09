#!/usr/bin/fish
fisher update

tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time=No --classic_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Light --prompt_spacing=Compact --icons='Many icons' --transient=No

set -U fish_greeting

# https://github.com/jethrokuan/fzf
set -U FZF_FIND_FILE_COMMAND "fd -H"
set -U FZF_CD_COMMAND "fd -t d -H . $HOME"
# ignoring the intended purpose of this
# ALT+C is used for global cd in ~
# ALT+SHIFT+C is for cd in pwd
set -U FZF_CD_WITH_HIDDEN_COMMAND "fd -t d -H"

fish_config theme save "Catppuccin Macchiato"
