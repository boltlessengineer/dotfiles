local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

local config_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- TODO: Update this with original github setup {} code
nvim_tree.setup {
  disable_netrw = true,
  hijack_cursor = false,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {
    'startify',
    'dashboard',
    'alpha',
  },
  open_on_tab = false,
  update_cwd = true,
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
      custom_only = false,
      list = {
        { key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
        { key = 'h', cb = tree_cb 'close_node' },
        { key = 'v', cb = tree_cb 'vsplit' },
      },
    },
    number = false,
    relativenumber = false,
  },
  renderer = {
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        folder = {
          arrow_closed = '',
          arrow_open = '',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
        git = {
          unstaged = '✗',
          staged = '✓',
          unmerged = '',
          renamed = '➜',
          untracked = '?',
          deleted = '',
          ignored = '◌',
        },
      }
    }
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = '',
      info = '',
      warning = '',
      error = '',
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}
