# only apply aliases if not inside a container
if [ -z "$container" ]; then
    # alias vim='gvim -v'
    alias vim='nvim'

    alias ls='exa --icons'
    alias ll='exa -l --git --icons'
    alias la='exa -la --git --icons'

    alias tree='exa --tree --icons'

    alias flatpak-run='flatpak run $(flatpak list --columns=application | fzf)'

    alias cat="bat"

    alias ranger='. ranger ranger'
    alias r='. ranger ranger'

    alias neofetch="neowofetch"

    alias yay="distrobox enter arch -- yay"
    alias zeditor="distrobox enter arch -- zeditor"
    alias yazi="distrobox enter arch -- yazi"
fi

alias open="xdg-open"
alias :q='exit'
