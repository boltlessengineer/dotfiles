local wezterm = require 'wezterm'
return {
  font = wezterm.font_with_fallback {
    'Fira Code',
    'Symbols Nerd Font',
    -- TODO: better Korean font
  },
  font_size = 16.0,
  color_scheme = 'Catppuccin Mocha',
}
