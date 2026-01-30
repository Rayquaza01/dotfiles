--- @sync entry
return {
    entry = function()
        -- leave visual mode to save the selection
        ya.mgr_emit("escape", { visual = true })

        local h = cx.active.current.hovered

        -- if hovered is a directory, enter it
        -- otherwise, open selected files
        if h and h.cha.is_dir then
            ya.mgr_emit("enter", {})
        else
            ya.mgr_emit("open", {})
        end
    end,
}
