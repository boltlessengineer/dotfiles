local wezterm = require 'wezterm'
return {
  font = wezterm.font_with_fallback {
    'FiraCode Nerd Font',
    -- TODO: better Korean font
  },
  color_scheme = 'Catppuccin Mocha',
  window_background_opacity = 0.97,
}
