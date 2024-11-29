return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = { "italic" }, -- Change the style of comments
					conditionals = { "italic" },
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					-- miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {
					mocha = {
						-- rosewater = "#XXXXXX",
						-- flamingo = "#XXXXXX",
						-- pink = "#XXXXXX",
						-- mauve = "#XXXXXX",
						-- red = "#XXXXXX",
						-- maroon = "#XXXXXX",
						-- peach = "#XXXXXX",
						-- yellow = "#XXXXXX",
						-- green = "#XXXXXX",
						-- teal = "#XXXXXX",
						-- sky = "#XXXXXX",
						-- sapphire = "#XXXXXX",
						-- blue = "#XXXXXX",
						-- lavender = "#XXXXXX",
						-- text = "#XXXXXX",
						-- subtext1 = "#XXXXXX",
						-- subtext0 = "#XXXXXX",
						-- overlay2 = "#XXXXXX",
						-- overlay1 = "#XXXXXX",
						-- overlay0 = "#XXXXXX",
						-- surface2 = "#XXXXXX",
						-- surface1 = "#XXXXXX",
						-- surface0 = "#XXXXXX",
						base = "#202020",
						mantle = "#222222",
						crust = "#333333",
					},
				},
				custom_highlights = {},
				default_integrations = true,
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					treesitter = true,
					notify = false,
					mini = {
						enabled = true,
						indentscope_color = "",
					},
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
