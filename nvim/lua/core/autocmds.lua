local augroup = vim.api.nvim_create_augroup('MyAutocmds', { clear = true })
local autocmd = function(events, opts)
  opts.group = augroup
  vim.api.nvim_create_autocmd(events, opts)
end

-- auto delete [No Name] buffers when hidden
autocmd('BufHidden', {
  callback = function(opts)
    if opts.file == '' and not vim.bo[opts.buf].modified and vim.bo[opts.buf].buftype == '' then
      vim.schedule(function()
        vim.api.nvim_buf_delete(opts.buf, {})
      end)
    end
  end
})

-- better native terminal
autocmd('TermOpen', {
  callback = function(opts)
    if vim.bo[opts.buf].filetype ~= '' then
      return
    end
    vim.notify('Terminal buffer detected')
    if vim.api.nvim_get_current_buf() ~= opts.buf then
      vim.notify('D')
      autocmd('BufEnter', {
        buffer = opts.buf,
        callback = function()
          vim.notify('Terminal entered')
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.signcolumn = 'no'
          return true
        end
      })
    else
      vim.notify('C')
    end
    vim.bo[opts.buf].filetype = 'terminal'
    vim.bo[opts.buf].buflisted = false
  end
})

local pickers = require('telescope.pickers')
local entry_display = require('telescope.pickers.entry_display')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

function GoTerm(opts)
  opts = opts or {}

  local buffers = {}
  -- for bufnr, isopen in pairs(termbufs) do
  --   local element = {
  --     bufnr = bufnr,
  --     isopen = isopen,
  --     info = vim.fn.getbufinfo(bufnr)[1],
  --     name = vim.fn.getbufinfo(bufnr)[1].name,
  --   }
  --   table.insert(buffers, element)
  -- end

  local displayer = entry_display.create({
    separator = ' ',
    items = {
      { width = opts.bufnr_width },
      { remaining = true },
    }
  })

  local make_display = function(entry)
    return displayer({
      { tostring(entry.bufnr), 'TelescopeResultsNumber' },
      entry.name or '[No Name]',
    })
  end

  pickers.new(opts, {
    prompt_title = 'Terminals',
    finder = finders.new_table({
      results = buffers,
      entry_maker = function(entry)
        return {
          value = entry,
          bufnr = entry.bufnr,
          name = entry.name,
          display = make_display,
          ordinal = tostring(entry.bufnr),
        }
      end,
    }),
    sorter = conf.generic_sorter(opts),
  }):find()
end

vim.keymap.set('n', 'tt', GoTerm)
