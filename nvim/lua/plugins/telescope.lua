local ok, telescope = pcall(require, 'telescope')
if not ok then
  return
end

local actions = require 'telescope.actions'

telescope.load_extension('cder')

-- TODO: make quicklist from searched result

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<ESC>'] = actions.close,
        ['<C-c>'] = actions.close,
      }
    }
  },
  extensions = {
    cder = {
    },
  },
}
