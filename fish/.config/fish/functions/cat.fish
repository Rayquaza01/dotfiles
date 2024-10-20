function cat --wraps=bat --description 'alias cat=bat'
    if command -q bat
        bat $argv
    else
        cat $argv
    end
end
