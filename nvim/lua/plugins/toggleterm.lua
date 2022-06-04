local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

local Terminal = require("toggleterm.terminal").Terminal

function _Lazygit_toggle()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    dir = "git_dir",
    direction = "float",
  })
  lazygit:toggle()
end

toggleterm.setup {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t>]],
}
