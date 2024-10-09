if status is-interactive
    # FZF CONFIG
    fzf --fish | source

    # export FZF_DEFAULT_COMMAND="fd -H"
    # export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    # export FZF_ALT_C_COMMAND="fd -t d -H . $HOME"


    # ALIAS CONFIG
    alias vim="nvim"
    export EDITOR="nvim"

    alias ls='eza --icons'
    alias ll='eza -l --git --icons'
    alias la='eza -la --git --icons'

    alias tree='eza --tree --icons'

    alias flatpak-run='flatpak run $(flatpak list --columns=application | fzf)'

    alias cat="bat"

    alias neofetch="fastfetch"

    alias yay="distrobox enter arch -- yay"
    alias zeditor="distrobox enter arch -- zeditor"
    alias yazi="distrobox enter arch -- yazi"

    alias godot="flatpak run --command=godot org.godotengine.Godot"
end
