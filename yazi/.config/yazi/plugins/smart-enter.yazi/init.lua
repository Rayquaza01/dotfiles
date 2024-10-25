return {
    entry = function()
        ya.manager_emit("escape", { visual = true })

        local h = cx.active.current.hovered

        -- if hovered is a directory, enter it
        if h and h.cha.is_dir then
            ya.manager_emit("enter", {})
            return
        end

        -- open selected files
        ya.manager_emit("open", {})
    end,
}
