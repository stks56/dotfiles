-- Initialize
local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.enable_wayland = false

-- Appearance
config.color_scheme = "nord"
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 12
config.window_background_opacity = 0.8
config.inactive_pane_hsb = { brightness = 0.5 }
config.window_decorations = "RESIZE"
config.font = wezterm.font_with_fallback({
	"Google Sans Code",
	"Intel One Mono",
	"Menlo",
})

-- Debug
config.debug_key_events = true
config.status_update_interval = 100

-- Tab
wezterm.on("format-tab-title", function(tab)
	return {
		{ Text = " " .. tab.tab_index + 1 .. ":" },
	}
end)

-- keyBinds
-- config.disable_default_key_bindings = true

local act = wezterm.action

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
		key = "t",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "w",
		mods = "LEADER",
		action = act.CloseCurrentPane({ confirm = true }),
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
		key = "h",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{
		key = "k",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "l",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = act.PaneSelect,
	},
	{
		key = "[",
		mods = "LEADER",
		action = act.MoveTabRelative(-1),
	},
	{
		key = "]",
		mods = "LEADER",
		action = act.MoveTabRelative(1),
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

-- End configuration
return config
