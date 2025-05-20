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
local mac = wezterm.target_triple:find("darwin")
local linux = wezterm.target_triple:find("-linux-")

if mac then
	config.keys = {
		{
			key = "f",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "f", mods = "CTRL" }),
		},
		{
			key = "b",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "b", mods = "CTRL" }),
		},
		{
			key = "n",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "n", mods = "CTRL" }),
		},
		{
			key = "p",
			mods = "CMD",
			action = wezterm.action.SendKey({ key = "p", mods = "CTRL" }),
		},
		{
			key = "d",
			mods = "CMD",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "D",
			mods = "CMD",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Next"),
		},
		{
			key = "q",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x00" }),
		},
		{
			key = "e",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x04" }),
		},
		{
			key = "Backspace",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x16" }), -- backward-kill-word
		},
		{
			key = "Backspace",
			mods = "SHIFT|CMD",
			action = wezterm.action({ SendString = "\x14" }), -- backward-kill-line
		},
		{
			key = "LeftArrow",
			mods = "ALT",
			action = wezterm.action({ SendString = "\x0bb" }), -- backward-word
		},
		{
			key = "RightArrow",
			mods = "ALT",
			action = wezterm.action({ SendString = "\x0bf" }), -- backward-word
		},
		{
			key = "LeftArrow",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x00" }), -- beginning-of-line
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x04" }), -- end-of-line
		},
		{
			key = "C",
			mods = "CMD|SHIFT",
			action = wezterm.action({ SendString = "\x03" }),
		},
		-- {key="LeftArrow", mods="CMD|SHIFT", action=wezterm.action{SendKey={key="Home"}}},
		-- {key="LeftArrow", mods="SHIFT", action="SelectTextAtCursorLeft"},
		-- {key="RightArrow", mods="SHIFT", action="SelectTextAtCursorRight"}
	}
elseif linux then
	config.keys = {
		{
			key = "d",
			mods = "CTRL",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "D",
			mods = "CTRL",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CTRL",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Next"),
		},
		{
			key = "q",
			mods = "CTRL",
			action = wezterm.action({ SendString = "\x00" }),
		},
		{
			key = "e",
			mods = "CTRL",
			action = wezterm.action({ SendString = "\x04" }),
		},
		{
			key = "Backspace",
			mods = "CTRL",
			action = wezterm.action({ SendString = "\x16" }), -- backward-kill-word
		},
		{
			key = "Backspace",
			mods = "SHIFT|CTRL",
			action = wezterm.action({ SendString = "\x14" }), -- backward-kill-line
		},
		{
			key = "LeftArrow",
			mods = "ALT",
			action = wezterm.action({ SendString = "\x0bb" }), -- backward-word
		},
		{
			key = "RightArrow",
			mods = "ALT",
			action = wezterm.action({ SendString = "\x0bf" }), -- backward-word
		},
		{
			key = "LeftArrow",
			mods = "CTRL",
			action = wezterm.action({ SendString = "\x00" }), -- beginning-of-line
		},
		{
			key = "RightArrow",
			mods = "CTRL",
			action = wezterm.action({ SendString = "\x04" }), -- end-of-line
		},
		{
			key = "c",
			mods = "CTRL",
			action = wezterm.action.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CTRL",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
		{
			key = "C",
			mods = "CTRL|SHIFT",
			action = wezterm.action({ SendString = "\x03" }),
		},
		-- {key="LeftArrow", mods="CMD|SHIFT", action=wezterm.action{SendKey={key="Home"}}},
		-- {key="LeftArrow", mods="SHIFT", action="SelectTextAtCursorLeft"},
		-- {key="RightArrow", mods="SHIFT", action="SelectTextAtCursorRight"}
	}
end

-- End configuration
return config
