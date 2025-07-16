local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.keys = {
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
			key = "w",
			mods = "CTRL",
			action = act.CloseCurrentTab({ confirm = true }),
		},
		{
			key = "t",
			mods = "CTRL",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "m",
			mods = "CTRL",
			action = act.PaneSelect,
		},
		{
			key = "s",
			mods = "CTRL",
			action = wezterm.action.DisableDefaultAssignment,
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
