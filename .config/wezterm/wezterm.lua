-- Initialize
local wezterm = require("wezterm")
local config = wezterm.config_builder()
config.enable_wayland = false

-- Appearance
config.color_scheme = "NightOwl (Gogh)"
config.hide_tab_bar_if_only_one_tab = true
config.font_size = 12
config.window_background_opacity = 0.95
config.inactive_pane_hsb = { brightness = 0.5 }
config.window_decorations = "RESIZE"
config.font = wezterm.font_with_fallback({
	"Google Sans Code",
	"Intel One Mono",
	"Menlo",
})

-- session manager
local session_manager = require("session-manager")
wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

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

config.status_update_interval = 100

local tab_color_schema = {
	Idle = "#4a5568", -- グレー（待機中）
	Run = "#38a169", -- グリーン（実行中）
	Sleep = "#3182ce", -- ブルー（スリープ中）
	Stop = "#e53e3e", -- レッド（停止中）
	Zombie = "#d69e2e", -- イエロー（ゾンビプロセス）
	Tracing = "#805ad5", -- パープル（トレース中）
	Dead = "#2d3748", -- ダークグレー（終了）
}

function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	return {
		{ Text = " " .. tab.tab_index + 1 .. ":" },
	}
end)

local function is_claude(pane)
	local process = pane:get_foreground_process_info()
	if not process or not process.argv then
		return false
	end
	-- 引数に"claude"が含まれているかチェック
	for _, arg in ipairs(process.argv) do
		if arg:find("claude") then
			return true
		end
	end
	return false
end

wezterm.on("bell", function(window, pane)
	if is_claude(pane) then
		window:toast_notification("Claude Code", "Task completed", nil, 4000)
	end
end)

-- End configuration
return config
