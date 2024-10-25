return {
    entry = function()
        -- leave visual mode to save the selection
        ya.manager_emit("escape", { visual = true })

        local h = cx.active.current.hovered

        -- if hovered is a directory, enter it
        -- otherwise, open selected files
        if h and h.cha.is_dir then
            ya.manager_emit("enter", {})
        else
            ya.manager_emit("open", {})
        end
    end,
}
