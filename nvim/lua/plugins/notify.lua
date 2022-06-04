local ok, notify = pcall(require, "notify")
if not ok then
  return
end

local renderers = require("notify.render")

notify.setup {
  background_colour = "Normal",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = function(bufnr, notif, highlights, config)
    if notif.title[1] == "" then
      return renderers.minimal(bufnr, notif, highlights, config)
    else
      return renderers.default(bufnr, notif, highlights, config)
    end
  end,
  stages = "fade_in_slide_out",
  timeout = 2000,
}

vim.notify = notify
