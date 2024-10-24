function tree --wraps='eza --tree --icons' --description 'alias tree=eza --tree --icons'
    if command -q eza
        eza --tree --icons $argv
    else if command -q exa
        exa --tree --icons $argv
    else
        command tree $argv
    end
end
