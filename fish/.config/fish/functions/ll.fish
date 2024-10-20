function ll --wraps='eza -l --git --icons' --description 'alias ll=eza -l --git --icons'
    if command -q eza
        eza -l --git --icons $argv
    else if command -q exa
        exa -l --git --icons $argv
    else
        ls -l $argv
    end
end
