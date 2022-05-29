local ok, notify = pcall(require, "notify")
if not ok then
  return
end

local renderers = require("notify.render")

notify.setup {
  stages = 'slide',
  timeout = 2500,
  render = function (bufnr, notif, highl)
    if notif.title[1] == "" then
      return renderers.minimal(bufnr, notif, highl)
    else
      return renderers.default(bufnr, notif, highl)
    end
  end
}

vim.notify = notify
