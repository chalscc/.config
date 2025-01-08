local wezterm = require("wezterm")

local config = {
	audible_bell = "Disabled",
	check_for_updates = false,
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	colors = {
		background = "#111111",
	},
	font_size = 9.5,
	launch_menu = {},
	disable_default_key_bindings = true,
	font = wezterm.font("JetBrains Mono"),
	max_fps = 144,
}

-- LEADER keybind
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }

-- custom keybindings defined
local leader_key_bindings = {
	-- tabs
	{ key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "p", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "n", action = wezterm.action.ActivateTabRelative(1) },
	-- panes
	{ key = "x", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "o", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- movement
	{ key = "h", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", action = wezterm.action.ActivatePaneDirection("Right") },
	-- resize
	{ key = "LeftArrow", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "DownArrow", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
}

-- define keybinds and add the LEADER key to trigger them
config.keys = {}
for _, binding in ipairs(leader_key_bindings) do
	table.insert(config.keys, {
		mods = "LEADER",
		key = binding.key,
		action = binding.action,
	})
end

-- Add to key_tables so the following command works
-- :!wezterm show-keys --lua --key-table custom
config.key_tables = {
	custom = leader_key_bindings,
}

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = true
config.tab_and_split_indices_are_zero_based = true

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local prefix = ""

	if window:leader_is_active() then
		prefix = "Command mode " .. utf8.char(0x26A1)
	end

	window:set_left_status(wezterm.format({
		{ Text = prefix },
	}))
end)

return config
