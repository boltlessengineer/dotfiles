local termbufs = {}

local augroup = vim.api.nvim_create_augroup('terminal', { clear = true })
local function newBuf(opts)
  opts = opts or {}
  opts.cmd = opts.cmd or vim.o.shell

  local buf = vim.api.nvim_create_buf(true, false)
  -- vim.bo[buf].buflisted = false
  vim.bo[buf].filetype = 'term'
  vim.api.nvim_buf_call(buf, function()
    vim.fn.termopen(opts.cmd, {
      detach = 1,
      on_exit = function()
        -- if opts.autoclose then
        --   vim.api.nvim_buf_delete(buf, {})
        -- end
      end,
    })
  end)

  -- Edit buffer name (add bufnr)
  local name = vim.api.nvim_buf_get_name(buf)
  name = name .. '#' .. buf
  vim.api.nvim_buf_set_name(buf, name)

  -- Save terminal-buffer's bufnr
  table.insert(termbufs, {
    bufnr = buf,
  })
  vim.api.nvim_create_autocmd('BufDelete', {
    group = augroup,
    buffer = buf,
    callback = function()
      for i, term in ipairs(termbufs) do
        if term.bufnr == buf then
          table.remove(termbufs, i)
        end
      end
    end
  })
  return buf
end

function _G.term(opts)
  if type(opts) == 'string' then
    opts = { cmd = opts }
  end
  local buf = newBuf(opts)
  vim.cmd.tabnew()
  vim.api.nvim_set_current_buf(buf)
  vim.api.nvim_buf_call(buf, function()
    -- vim.cmd.setlocal('norenu')
    -- vim.opt_local.signcolumn = 'no'
    -- vim.opt_local.number = false
    -- vim.opt_local.relativenumber = false
  end)
  -- local win = vim.api.nvim_get_current_win()
  -- vim.wo[win].signcolumn = 'no'
  -- vim.wo[win].number = false
  -- vim.wo[win].relativenumber = false
end

function _G.select_buf()
  vim.ui.select(termbufs,
    {
      prompt = 'Select LuaTerm Buffers',
      format_item = function(item)
        return item.bufnr .. ' - ' .. (item.name or 'No Name Terminal')
      end,
    },
    function(choice)
      if choice then
        vim.api.nvim_set_current_buf(choice.bufnr)
      end
    end)
end

vim.keymap.set('n', '<c-t>', term)
vim.keymap.set('n', '<c-p>', function()
  print(vim.inspect(termbufs))
end)

-- handle closing with autocmds

-- <C-;><leader> -> open luaterm buffer here (using telescope)
-- <C-;>; -> switch to luaterm buffer (using telescope)
--
-- open or switch current terminal buffer window to
-- <C-;>t -> open terminal buffer in new tab
-- <C-;>f -> open terminal buffer in floating window
--
-- Telescope format
--
-- bufnr | terminal_name
-- +
-- [[New Terminal]]
