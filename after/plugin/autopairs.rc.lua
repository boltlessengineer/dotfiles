local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then return end

-- TODO - should learn more : https://github.com/windwp/nvim-autopairs
autopairs.setup({
  -- add custom setup
  enable_check_bracket_line = true,
})
