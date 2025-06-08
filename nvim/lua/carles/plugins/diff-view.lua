return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>ho", "<cmd>DiffviewOpen<CR>", desc = "Open Diffview" },
		{ "<leader>hh", "<cmd>DiffviewFileHistory<CR>", desc = "File History (Diffview)" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("diffview").setup({
			use_icons = true,
		})
	end,
}
