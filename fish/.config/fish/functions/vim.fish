function vim --wraps=nvim --description 'alias vim=nvim'
    if command -q nvim
        nvim $argv
    else if command -q gvim
        gvim -v $argv
    else
        vim $argv
    end
end
