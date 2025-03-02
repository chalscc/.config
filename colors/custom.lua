local colors = {
	-- Accent Colors (Lualine & UI Highlights)
	blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	red = "#FF4A4A",

	-- Text & Background Colors
	foreground = "#c3ccdc",
	active_background = "#393939",

	-- Colorscheme Base Tones
	base = "#292929",
	mantle = "#222222",
	crust = "#333333",

	-- Terminal Background
	terminal_bg = "#161616",
}

local colorscheme = {
	-- Accent Colors
	blue = colors.blue,
	green = colors.green,
	violet = colors.violet,
	yellow = colors.yellow,
	red = colors.red,

	-- Text & Background Colors
	foreground = colors.foreground,
	active_background = colors.active_background,
	inactive_background = colors.base,

	-- Colorscheme Base Tones
	base = colors.base,
	mantle = colors.mantle,
	crust = colors.crust,

	-- Terminal Background
	terminal_bg = colors.terminal_bg,
}

return colorscheme
