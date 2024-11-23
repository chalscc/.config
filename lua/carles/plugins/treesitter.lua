return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			indent = {
				enable = true,
			},
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
			},
			-- default values
			modules = {},
			sync_install = false,
			auto_install = false,
			ignore_install = {},

			textobjects = {
				select = {
					enable = true,
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = { query = "@function.outer", desc = "Function" },
						["if"] = { query = "@function.inner", desc = "Function" },

						["ac"] = { query = "@call.outer", desc = "Call" },
						["ic"] = { query = "@call.inner", desc = "Call" },

						["aa"] = { query = "@parameter.outer", desc = "Parameter" },
						["ia"] = { query = "@parameter.inner", desc = "Parameter" },

						["av"] = { query = "@assignment.lhs", desc = "Left assignment" },
						["iv"] = { query = "@assignment.rhs", desc = "Right assignment" },

						["al"] = { query = "@loop.outer", desc = "Loop" },
						["il"] = { query = "@loop.inner", desc = "Loop" },

						["ai"] = { query = "@conditional.outer", desc = "If" },
						["ii"] = { query = "@conditional.inner", desc = "If" },

						["ar"] = { query = "@return.outer", desc = "Return" },
						["ir"] = { query = "@return.inner", desc = "Return" },

						["a/"] = { query = "@comment.outer", desc = "Comment" },

						["in"] = { query = "@number.inner", desc = "Number" },
					},
				},
			},

			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-s>",
					node_incremental = "<C-s>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
