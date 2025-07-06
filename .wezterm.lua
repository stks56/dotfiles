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

-- Key binding
local mainmod = "CTRL"
if wezterm.target_triple:find("darwin") then
	mainmod = "CMD"
end

wezterm.macos_forward_to_ime_modifier_mask = "CMD"

config.keys = {
	{
		key = "f",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x06" }), -- forward-char
	},
	{
		key = "b",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x02" }), -- backward-char
	},
	{
		key = "p",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x10" }), -- previous-line
	},
	{
		key = "n",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x0E" }), -- next-line
	},
	{
		key = "a",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x01" }), -- beginning-of-line
	},
	{
		key = "e",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x05" }), -- end-of-line
	},
	{
		key = "f",
		mods = mainmod .. "|SHIFT",
		action = wezterm.action({ SendString = "\x0bf" }), -- forward-word
	},
	{
		key = "b",
		mods = mainmod .. "|SHIFT",
		action = wezterm.action({ SendString = "\x0bb" }), -- backward-word
	},
	{
		key = "l",
		mods = mainmod,
		action = wezterm.action.ClearScrollback("ScrollbackOnly"),
	},
	{
		key = "d",
		mods = mainmod,
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "D",
		mods = mainmod,
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "w",
		mods = mainmod,
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "Tab",
		mods = mainmod,
		action = wezterm.action.ActivatePaneDirection("Next"),
	},
	{
		key = "q",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x00" }),
	},
	{
		key = "e",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x04" }),
	},
	{
		key = "Backspace",
		mods = mainmod,
		action = wezterm.action({ SendString = "\x16" }), -- backward-kill-word
	},
	{
		key = "Backspace",
		mods = mainmod .. "|SHIFT",
		action = wezterm.action({ SendString = "\x14" }), -- backward-kill-line
	},
	{
		key = "c",
		mods = mainmod,
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = mainmod,
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "C",
		mods = mainmod .. "|SHIFT",
		action = wezterm.action({ SendString = "\x03" }),
	},
	-- {key="LeftArrow", mods="CMD|SHIFT", action=wezterm.action{SendKey={key="Home"}}},
	-- {key="LeftArrow", mods="SHIFT", action="SelectTextAtCursorLeft"},
	-- {key="RightArrow", mods="SHIFT", action="SelectTextAtCursorRight"}
}

-- End configuration
return config
