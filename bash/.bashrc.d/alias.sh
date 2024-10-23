# only apply aliases if not inside a container
if [ -z "$container" ]; then
    # alias vim='gvim -v'
    alias vim='nvim'

    alias ls='eza --icons'
    alias ll='eza -l --git --icons'
    alias la='eza -la --git --icons'

    alias tree='eza --tree --icons'

    alias flatpak-run='flatpak run $(flatpak list --columns=application | fzf)'

    alias cat="bat"

    # alias ranger='. ranger ranger'
    # alias r='. ranger ranger'

    alias neofetch="fastfetch"

    alias godot="flatpak run --command=godot org.godotengine.Godot"
fi

alias open="xdg-open"
alias :q='exit'
