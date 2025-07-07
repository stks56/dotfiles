-- Initialize
local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.enable_wayland = false

-- Appearance
config.color_scheme = "NightOwl (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 12.0
config.window_background_opacity = 0.95
config.inactive_pane_hsb = { brightness = 0.5 }
config.window_decorations = "RESIZE"

-- debug
config.debug_key_events = true

-- Key binding
local keybinds = {}
if wezterm.target_triple:find("darwin") then
	keybinds = require("darwin.keybinds")
else
	keybinds = require("linux.keybinds")
end

keybinds.apply_to_config(config)

-- End configuration
return config
