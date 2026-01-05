local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

function M.apply_to_config(config)
	config.leader = {
		key = "s",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	}

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
			key = "t",
			mods = "CTRL",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "w",
			mods = "LEADER",
			action = act.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "t",
			mods = "LEADER",
			action = act.ShowTabNavigator,
		},
		{
			key = "z",
			mods = "LEADER",
			action = act.TogglePaneZoomState,
		},
		{
			key = "'",
			mods = "CTRL",
			action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = '"',
			mods = "CTRL|SHIFT",
			action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "j",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Left", 5 }),
		},
		{
			key = "k",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Down", 5 }),
		},
		{
			key = "i",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Up", 5 }),
		},
		{
			key = "l",
			mods = "LEADER",
			action = act.AdjustPaneSize({ "Right", 5 }),
		},
		{
			key = "q",
			mods = "CTRL",
			action = act({ SendString = "\x00" }),
		},
		{
			key = "m",
			mods = "LEADER",
			action = act.PaneSelect,
		},
		{
			key = "{",
			mods = "CTRL",
			action = act.PaneSelect({ mode = "SwapWithActive" }),
		},
		{
			key = "s",
			mods = "CTRL",
			action = wezterm.action.DisableDefaultAssignment,
		},
	}

	for i = 1, 10 do
		table.insert(config.keys, {
			key = tostring(i % 10),
			mods = "CTRL",
			action = act.ActivateTab(i - 1),
		})
	end
end

return M
