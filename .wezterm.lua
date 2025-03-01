-- Initialize
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = 'NightOwl (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 12.0
config.window_background_opacity = 0.95
config.inactive_pane_hsb = {
  brightness = 0.5,
}
config.window_decorations = "RESIZE"
-- Key binding
config.keys = {
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'D',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'Tab',
    action = wezterm.action.ActivatePaneDirection 'Next',
  },
  {
    key = 'Tab',
    mods = 'SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Prev',
  }
}

-- End configuration
return config
