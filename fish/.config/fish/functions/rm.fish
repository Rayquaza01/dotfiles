function rm --wraps=trash --description 'alias rm=trash'
    if command -q trash
        command trash $argv
    else
        command rm $argv
    end
end
