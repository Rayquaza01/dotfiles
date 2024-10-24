function la --wraps='eza -la --git --icons' --description 'alias la=eza -la --git --icons'
    if command -q eza
        eza -la --git --icons $argv
    else if command -q exa
        exa -la --git --icons $argv
    else
        command ls --color="auto" -la $argv
    end
end
