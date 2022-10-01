local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

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
    -- TODO: function to calculate suitable width (open on current window in small width)
    width = 30,
    hide_root_folder = false,
    side = 'left',
    number = false,
    relativenumber = false,
    mappings = {
      custom_only = true,
      list = {
        -- KEMAPS
        { key = { 'l', '<CR>' }, action = 'edit' },
        { key = 'e', action = 'edit_in_place' },
        { key = 'h', action = 'close_node' },
        { key = 'v', action = 'vsplit' },
        { key = '0', action = 'first_sibling' },
        { key = '$', action = 'last_sibling' },
        { key = 'I', action = 'toggle_git_ignored' },
        { key = 'H', action = 'toggle_dotfiles' },
        { key = 'U', action = 'toggle_custom' },
        { key = 'R', action = 'refresh' },
        { key = 'a', action = 'create' },
        { key = 'd', action = 'remove' },
        { key = 'D', action = 'trash' },
        { key = 'r', action = 'rename' },
        { key = '<C-r>', action = 'full_rename' },
        { key = 'x', action = 'cut' },
        { key = 'c', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'y', action = 'copy_name' },
        { key = 'Y', action = 'copy_path' },
        { key = 'gy', action = 'copy_absolute_path' },
        { key = '?', action = 'toggle_help' },
      },
    },
  },
  renderer = {
    indent_markers = {
      -- enable = true,
      icons = {
      }
    },
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
          unstaged = 'U',
          staged = '+',
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
    enable = false,
    update_cwd = false,
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
