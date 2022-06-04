local ok, diffview = pcall(require, "diffview")
if not ok then
  return
end

local actions = require("diffview.actions")

diffview.setup {
  keymaps = {
    disable_defaults = true,
    view = {
    },
    file_panel = {
      ["j"]    = actions.next_entry,
      ["k"]    = actions.prev_entry,
      ["<CR>"] = actions.select_entry,
    },
    file_history_panel = {
      ["j"]    = actions.next_entry,
      ["k"]    = actions.prev_entry,
      ["<CR>"] = actions.select_entry,
      ["y"]    = actions.copy_hash,
    },
    option_panel = {
    },
  },
}
