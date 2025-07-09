local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
		{
			key = "F",
			mods = "CTRL|SHIFT",
			action = act({ SendString = "\x1bf" }), -- beginning-of-word
		},
		{
			key = "B",
			mods = "CTRL|SHIFT",
			action = act({ SendString = "\x1bb" }), -- beginning-of-word
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
			key = "Backspace",
			mods = "CTRL",
			action = act({ SendString = "\x16" }), -- backward-kill-word
		},
		{
			key = "Backspace",
			mods = "CTRL|SHIFT",
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
			mods = "CTRL|SHIFT",
			action = act({ SendString = "\x03" }),
		},
		{
			key = "m",
			mods = "CTRL",
			action = act.PaneSelect,
		},
		{
			key = "m",
			mods = "CTRL",
			action = act.PaneSelect,
		},
		{
			key = "s",
			mods = "CTRL",
			action = wezterm.action.DisableDefaultKeyBinding,
		},
	}

	for i = 1, 8 do
		table.insert(config.keys, {
			key = tostring(i),
			mods = "CTRL",
			action = act.ActivateTab(i - 1),
		})
	end
end

return M
