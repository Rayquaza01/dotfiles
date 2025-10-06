#!/usr/bin/fish
if type -q fisher;
    git checkout HEAD -- ./fish/.config/fish/fish_plugins

    if dialog --yesno "Run fisher update?" 0 0;
        fisher update
    end
end

if type -q tide;
    set tide_choice (
        dialog \
            --stdout \
            --title "Tide Prompt" \
            --menu "Option:" \
            0 0 2 \
            1 "Fancy" \
            2 "Minimal"
    )

    switch "$tide_choice"
        case 1
            tide configure --auto --style=Classic --prompt_colors='True color' --classic_prompt_color=Light --show_time=No --classic_prompt_separators=Round --powerline_prompt_heads=Round --powerline_prompt_tails=Round --powerline_prompt_style='Two lines, character and frame' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Light --prompt_spacing=Compact --icons='Many icons' --transient=No
        case 2
            tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No --lean_prompt_height='One line' --prompt_spacing=Compact --icons='Few icons' --transient=No
    end
end
