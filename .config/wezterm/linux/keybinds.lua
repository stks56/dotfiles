local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
		{
			key = "f",
			mods = "CTRL",
			action = act({ SendString = "\x06" }), -- forward-char
		},
		{
			key = "b",
			mods = "CTRL",
			action = act({ SendString = "\x02" }), -- previous-line
		},
		{
			key = "p",
			mods = "CTRL",
			action = act({ SendString = "\x10" }), -- previous-line
		},
		{
			key = "n",
			mods = "CTRL",
			action = act({ SendString = "\x0E" }), -- next-line
		},
		{
			key = "a",
			mods = "CTRL",
			action = act({ SendString = "\x01" }), -- beginning-of-line
		},
		{
			key = "e",
			mods = "CTRL",
			action = act({ SendString = "\x05" }), -- end-of-line
		},
		{
			key = "l",
			mods = "CTRL",
			action = act.ClearScrollback("ScrollbackOnly"),
		},
		{
			key = "d",
			mods = "CTRL",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "D",
			mods = "CTRL",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CTRL",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = act.ActivatePaneDirection("Next"),
		},
		{
			key = "q",
			mods = "CTRL",
			action = act({ SendString = "\x00" }),
		},
		{
			key = "e",
			mods = "CTRL",
			action = act({ SendString = "\x04" }),
		},
		{
			key = "Backspace",
			mods = "CTRL",
			action = act({ SendString = "\x16" }), -- backward-kill-word
		},
		{
			key = "Backspace",
			mods = "CTRL" .. "|SHIFT",
			action = act({ SendString = "\x14" }), -- backward-kill-line
		},
		{
			key = "c",
			mods = "CTRL",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CTRL",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "C",
			mods = "CTRL" .. "|SHIFT",
			action = act({ SendString = "\x03" }),
		},
		{
			key = "m",
			mods = "CTRL",
			action = act.PaneSelect,
		},
	}
end

return M
