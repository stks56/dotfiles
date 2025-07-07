local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
		{
			key = "f",
			mods = "CMD",
			action = act({ SendString = "\x06" }), -- forward-char
		},
		{
			key = "b",
			mods = "CMD",
			action = act({ SendString = "\x02" }), -- previous-line
		},
		{
			key = "p",
			mods = "CMD",
			action = act({ SendString = "\x10" }), -- previous-line
		},
		{
			key = "n",
			mods = "CMD",
			action = act({ SendString = "\x0E" }), -- next-line
		},
		{
			key = "a",
			mods = "CMD",
			action = act({ SendString = "\x01" }), -- beginning-of-line
		},
		{
			key = "e",
			mods = "CMD",
			action = act({ SendString = "\x05" }), -- end-of-line
		},
		{
			key = "l",
			mods = "CMD",
			action = act.ClearScrollback("ScrollbackOnly"),
		},
		{
			key = "d",
			mods = "CMD",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "D",
			mods = "CMD",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "CMD",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "Tab",
			mods = "CMD",
			action = act.ActivatePaneDirection("Next"),
		},
		{
			key = "q",
			mods = "CMD",
			action = act({ SendString = "\x00" }),
		},
		{
			key = "e",
			mods = "CMD",
			action = act({ SendString = "\x04" }),
		},
		{
			key = "Backspace",
			mods = "CMD",
			action = act({ SendString = "\x16" }), -- backward-kill-word
		},
		{
			key = "Backspace",
			mods = "CMD|SHIFT",
			action = act({ SendString = "\x14" }), -- backward-kill-line
		},
		{
			key = "c",
			mods = "CMD",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CMD",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "C",
			mods = "CMD|SHIFT",
			action = act({ SendString = "\x03" }),
		},
		{
			key = "m",
			mods = "CMD",
			action = act.PaneSelect,
		},
		{
			key = "m",
			mods = "CMD",
			action = act.PaneSelect,
		},
		{
			key = "x",
			mods = "CMD",
			action = wezterm.action({ SendString = "\x18" }), -- CAN
		},
	}
end

return M
