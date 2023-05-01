local wezterm = require 'wezterm'

-- find from: https://github.com/thanhvule0310/dotfiles/blob/main/config/wezterm/wezterm.lua
local function get_process(tab)
  local process_icons = {
    ["fish"] = {
      { Text = wezterm.nerdfonts.mdi_fish },
    },
    ["docker"] = {
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["nvim"] = {
      { Text = wezterm.nerdfonts.custom_vim },
    },
    ["vim"] = {
      { Text = wezterm.nerdfonts.dev_vim },
    },
    ["node"] = {
      { Text = wezterm.nerdfonts.mdi_hexagon },
    },
    ["go"] = {
      { Text = wezterm.nerdfonts.mdi_language_go },
    },
    ["cargo"] = {
      { Text = wezterm.nerdfonts.dev_rust },
    },
    ["lua"] = {
      { Text = wezterm.nerdfonts.seti_lua },
    },
    ["wget"] = {
      { Text = wezterm.nerdfonts.mdi_arrow_down_box },
    },
    ["curl"] = {
      { Text = wezterm.nerdfonts.mdi_flattr },
    },
    ['lazygit'] = {
      { Text = wezterm.nerdfonts.dev_git },
    },
  }

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")
  if process_name == '' then
    process_name = '?'
  end

  return wezterm.format(process_icons[process_name]
    or {
      { Text = string.format('[%s]', process_name) }
    })
end

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format("file://%s", os.getenv("HOME"))
  return current_dir == HOME_DIR and "  ~"
      or string.format("  %s", string.gsub(current_dir, "(.*[/\\])(.*)", "%2"))
end

wezterm.on(
  'format-tab-title',
  function(tab, _tabs, _panes, _config, hover, _max_width)
    local background = '#1b1032'
    local foreground = '#c0c0c0'
    if tab.is_active then
      local tmp = background
      background = foreground
      foreground = tmp
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    return wezterm.format({
      { Foreground = { Color = foreground } },
      { Background = { Color = background } },
      { Text = string.format(' %s  ', tab.tab_index + 1) },
      { Text = get_process(tab) },
      { Text = " " },
      { Text = get_current_working_dir(tab) },
      { Text = ' ▕' },
    })
  end
)

local lineheight = 1.5

return {
  font = wezterm.font_with_fallback {
    'Fira Code',
    'Menlo',
    'Sarasa Mono K',
    'Noto Color Emoji',
    -- 'codicon',
    'Symbols Nerd Font Mono',
  },
  font_rules = {
    {
      italic = true,
      intensity = 'Normal',
      font = wezterm.font {
        -- other cursive fonts : Operator Mono, Cascadia Mono, Victor Mono, Dank Mono
        family = 'Cascadia Code',
        harfbuzz_features = { 'ss01=1' },
        weight = 'DemiLight',
        style = 'Italic',
      },
    },
    {
      italic = true,
      intensity = 'Bold',
      font = wezterm.font {
        family = 'Cascadia Code',
        harfbuzz_features = { 'ss01=1' },
        weight = 'Bold',
        style = 'Italic',
      },
    },
  },
  line_height = lineheight,
  allow_square_glyphs_to_overflow_width = "Always",
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  tab_max_width = 50,
  adjust_window_size_when_changing_font_size = false,
  -- window_background_opacity = 0.9,
  macos_window_background_blur = 20,
  -- window_decorations = "RESIZE",
  window_padding = {
    top    = 0,
    bottom = 0,
    left   = 0,
    right  = 0,
  },
  use_resize_increments = true,
  font_size = 16.0,
  -- set underline at bottom position based on lineheight
  -- NOTE: subtract 150 to prevent undercurl cutoff
  underline_position = ((lineheight - 1) * 1000 + 300) - 150 .. '%',
  underline_thickness = "1.5pt",
  cursor_thickness = "1pt",
  color_scheme = 'Catppuccin Mocha',
  disable_default_key_bindings = false,
  enable_csi_u_key_encoding = false,
  enable_kitty_keyboard = false,
  keys = {
    { key = 'Tab', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
    { key = 'Tab', mods = 'CTRL|SHIFT', action = wezterm.action.DisableDefaultAssignment },
    { key = 's', mods = 'CMD', action = wezterm.action.SendKey { key = 's', mods = 'ALT' } },
    -- { key = '1', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '2', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '3', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '4', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '5', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '6', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '7', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '8', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
    -- { key = '9', mods = 'CMD', action = wezterm.action.DisableDefaultAssignment },
  },
  use_ime = true,
}
