return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local conf = require("telescope.config").values

		telescope.setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					width = 0.9,
					height = 0.9,
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-h>"] = actions.select_horizontal, -- open result in vertical split
						["<C-v>"] = actions.select_vertical, -- open result in vertical vertical
						["<C-x>"] = actions.delete_buffer, -- delete result in buffer
						["<C-c>"] = actions.close, -- close telescope

						-- qflist
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<C-s>"] = actions.smart_add_to_qflist,
					},
					n = {
						["<C-c>"] = actions.close, -- close telescope
					},
				},
			},
		})

		table.insert(conf.vimgrep_arguments, "--fixed-strings")

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		-- keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" })
		keymap.set("n", "<leader>fh", "<cmd>Telescope git_status<cr>", { desc = "Fuzzy find git files" })
		-- keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Fuzzy find marks" })
		-- keymap.set("n", "<leader>fr", "<cmd>Telescope registers<cr>", { desc = "Fuzzy find registers" })
		keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Fuzzy find quickfix list" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope git_commits<cr>", { desc = "Fuzzy find commits" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope git_branches<cr>", { desc = "Fuzzy find branches" })

		keymap.set("n", "<leader>fj", "<cmd>cnext<cr>", { desc = "Next quickfix" })
		keymap.set("n", "<leader>fk", "<cmd>cprev<cr>", { desc = "Previous quickfix" })
	end,
}
