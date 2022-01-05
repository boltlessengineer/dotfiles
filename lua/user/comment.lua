local ok, comment = pcall(require, "Comment")
if not ok then return end

comment.setup {
  mappings = {
    basic = false,
    extra = false,
    extended = false,
  },
  pre_hook = function (ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.motion == U.cmotion.v or ctx.motion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      -- Determine whether to use linewise or blockwise commentstring
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end
}

local function map(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap = true, silent = true })
end
