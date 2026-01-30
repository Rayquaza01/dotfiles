--- @sync entry
-- https://github.com/sxyazi/yazi/discussions/1493
return {
   entry = function()
      local h = cx.active.current.hovered
      local original_url = h.link_to
      if h and original_url then
         ya.mgr_emit("reveal", { original_url })
      end
   end,
}
