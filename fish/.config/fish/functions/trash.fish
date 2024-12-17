function trash
    if command -q trash
        command trash -- "$argv"
    else if command -q gio
        gio trash -- "$argv"
    else
        echo "no trash command available"
    end
end
