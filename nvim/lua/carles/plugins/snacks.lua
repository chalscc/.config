return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Replaces dressing.nvim: better vim.ui.input
		input = { enabled = true },
		-- Needed for vim.ui.select (used by LSP code actions, etc.)
		picker = { enabled = true },
		-- Replaces indent-blankline.nvim
		indent = {
			enabled = true,
			indent = { char = "┊" },
		},
		-- Replaces lazygit.nvim
		lazygit = { enabled = true },
		-- Replaces nvim-tree.lua
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Open LazyGit",
		},
	},
}
