local wezterm = require("wezterm")
local custom_colors = dofile(os.getenv("USERPROFILE") .. "/.config/colors/custom.lua")

local config = {
	audible_bell = "Disabled",
	check_for_updates = false,
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	colors = {
		background = custom_colors.terminal_bg,
	},
	font_size = 9.5,
	launch_menu = {},
	disable_default_key_bindings = true,
	font = wezterm.font("JetBrains Mono"),
	max_fps = 144,
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_padding = {
		left = 0,
		right = 0,
		top = 5,
		bottom = 0,
	},
}

-- LEADER keybind
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 3000 }

-- custom keybindings defined
local leader_key_bindings = {
	-- tabs
	{ key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "p", mods = "LEADER", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "n", mods = "LEADER", action = wezterm.action.ActivateTabRelative(1) },
	-- panes
	{ key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
	{ key = "o", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "v", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "m", mods = "LEADER", action = wezterm.action.TogglePaneZoomState }, -- maximize/minimeze visibility of pane
	-- movement
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	-- resize
	{ key = "LeftArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "DownArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "UpArrow", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	-- copy/paste
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
	-- find
	{ key = "/", mods = "LEADER", action = wezterm.action.Search({ CaseInSensitiveString = "" }) },
	-- modes
	{ key = "F1", mods = "NONE", action = "ActivateCopyMode" },
}

-- define keybinds and add the LEADER key to trigger them
config.keys = {}
for _, binding in ipairs(leader_key_bindings) do
	table.insert(config.keys, {
		mods = binding.mods,
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
		prefix = utf8.char(0x26A1) .. utf8.char(0x26A1) .. utf8.char(0x26A1)
	end

	window:set_left_status(wezterm.format({
		{ Text = prefix },
	}))
end)

return config
