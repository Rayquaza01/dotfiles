#!/usr/bin/fish
if gum confirm "Run fisher update?";
    fisher update
end

if gum confirm "Configure tide?";
    tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time=No --classic_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Light --prompt_spacing=Compact --icons='Many icons' --transient=No
end
