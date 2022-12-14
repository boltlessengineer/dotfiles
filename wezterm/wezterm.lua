local wezterm = require 'wezterm'
return {
  font = wezterm.font_with_fallback {
    -- 'JetBrains Mono',
    'Fira Code',
    'Menlo',
    'Sarasa Mono K',
    -- 'FiraCode Nerd Font',
    'Noto Color Emoji',
    'Symbols Nerd Font Mono',
  },
  line_height = 1.2,
  allow_square_glyphs_to_overflow_width = "Always",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    top    = 0,
    bottom = 0,
    left   = 0,
    right  = 0,
  },
  font_size = 16.0,
  color_scheme = 'Catppuccin Mocha',
  -- disable_default_key_bindings = true,
}
