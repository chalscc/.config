return {
	"rguruprakash/simple-note.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("simple-note").setup({
			notes_dir = "~/notes/",
			notes_directories = {
				"~/notes/",
				"~/work/",
				-- "~/personal/",
			},
			telescope_new = "<C-n>",
			telescope_delete = "<C-x>",
			telescope_rename = "<C-r>",
			telescope_change_directory = "<C-d>",
		})
	end,
}
