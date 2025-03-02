-- Initialize
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = 'NightOwl (Gogh)'
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 12.0
config.window_background_opacity = 0.95
config.inactive_pane_hsb = {brightness = 0.5}
config.window_decorations = "RESIZE"

-- Key binding
config.keys = {
    {
        key = 'd',
        mods = 'CMD',
        action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain'}
    },
    {
        key = 'D',
        mods = 'CMD',
        action = wezterm.action.SplitVertical {domain = 'CurrentPaneDomain'}
    },
    {
        key = 'w',
        mods = 'CMD',
        action = wezterm.action.CloseCurrentPane {confirm = true}
    },
    {
        key = 'Tab',
        mods = 'CTRL',
        action = wezterm.action.ActivatePaneDirection 'Next'
    },
    {
        key="q",
        mods="CMD",
        action=wezterm.action{SendString="\x01"}
    },
    {
        key="e",
        mods="CMD",
        action=wezterm.action{SendString="\x05"}
    },
    {
        key = "Backspace",
        mods = "CMD",
        action = wezterm.action {SendString = "\x17"} -- backward-kill-word
    },
    {
        key = "Backspace",
        mods = "SHIFT|CMD",
        action = wezterm.action {SendString = "\x15"} -- backward-kill-line
    },
}

-- End configuration
return config
