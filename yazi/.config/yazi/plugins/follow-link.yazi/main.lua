--- @sync entry
-- https://github.com/sxyazi/yazi/discussions/1493
return {
   entry = function()
      ya.dbg("hi")
      local h = cx.active.current.hovered
      local original_url = h.link_to
      ya.dbg(original_url)
      if h and original_url then
         ya.manager_emit("reveal", { original_url })
      end
   end,
}
