function ls --wraps='eza --icons' --description 'alias ls=eza --icons'
    if command -q eza
        eza --icons $argv
    else if command -q exa
        exa --icons $argv
    else
        command ls --color="auto" $argv
    end
end
