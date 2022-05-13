local ok, feline = pcall(require, "feline")
if not ok then return end

local vi_mode_utils = require("feline.providers.vi_mode")
local lsp = require("feline.providers.lsp")

local comps = {
  vi_mode = {
    left = {
      provider = function()
        local label = ' ' .. vi_mode_utils.get_vim_mode() .. ' '
        return label
      end,
      hl = function()
        local set_color = {
          name = vi_mode_utils.get_mode_highlight_name(),
          bg = vi_mode_utils.get_mode_color(),
          style = 'bold',
        }
        return set_color
      end,
      left_sep = ' ',
      right_sep = ' ',
    }
  },
  -- Parse file information
  file = {
    -- File name
    info = {
      provider = {
        name = 'file_info',
        opts = {
          type = 'relative',
          file_modified_icon = '',
        }
      },
      hl = {},
      icon = '',
    },
    -- File type
    type = {
      provider = function()
        local type = vim.bo.filetype:lower()
        local extension = vim.fn.expand("%:e")
        local icon = require('nvim-web-devicons').get_icon(extension)
        if icon == nil then
          icon = ' '
        end
        return ' ' .. icon .. ' ' .. type
      end,
      hl = {},
      left_sep = ' ',
      right_sep = ' ',
    },
    -- File format (OS?)
    os = {
      provider = function()
        local os = vim.bo.fileformat:lower()
        local icon
        if os == 'unix' then
          icon = '  '
        elseif os == 'mac' then
          icon = '  '
        else
          icon = '  '
        end
        return icon .. os
      end,
    },
  }
}

feline.setup({
  force_incactive = {
    filetypes = {
      '^NvimTree$',
      '^packser$',
      '^vista$',
      '^help$',
    },
    buftypes = {
      '^terminal$'
    },
    bufnames = {},
  }
})
