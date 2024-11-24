function trash
    if command -q trash
        command trash -- "$argv"
    else if command -q gio
        gio trash -- "$argv"
    else
        # fall back to rm
        rm -I -- "$argv"
    end
end
