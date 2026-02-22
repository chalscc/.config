return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false, -- new nvim-treesitter does not support lazy-loading
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	config = function()
		-- Register install_dir in runtimepath (required by new nvim-treesitter)
		-- Parsers shipped with the plugin (.so = valid Windows DLLs) are in rtp via lazy.nvim
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Enable treesitter highlighting (Neovim built-in)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})

		-- Enable treesitter indentation
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- Autotagging
		require("nvim-ts-autotag").setup()

		-- Textobjects config
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
			},
		})

		-- Textobjects keymaps
		local select = require("nvim-treesitter-textobjects.select")
		local keymaps = {
			["af"] = { query = "@function.outer", desc = "Function outer" },
			["if"] = { query = "@function.inner", desc = "Function inner" },
			["ac"] = { query = "@call.outer", desc = "Call outer" },
			["ic"] = { query = "@call.inner", desc = "Call inner" },
			["aa"] = { query = "@parameter.outer", desc = "Parameter outer" },
			["ia"] = { query = "@parameter.inner", desc = "Parameter inner" },
			["av"] = { query = "@assignment.lhs", desc = "Variable assignment" },
			["iv"] = { query = "@assignment.rhs", desc = "Value assignment" },
			["al"] = { query = "@loop.outer", desc = "Loop outer" },
			["il"] = { query = "@loop.inner", desc = "Loop inner" },
			["ai"] = { query = "@conditional.outer", desc = "If outer" },
			["ii"] = { query = "@conditional.inner", desc = "If inner" },
			["ar"] = { query = "@return.outer", desc = "Return outer" },
			["ir"] = { query = "@return.inner", desc = "Return inner" },
			["a/"] = { query = "@comment.outer", desc = "Comment outer" },
			["i/"] = { query = "@comment.outer", desc = "Comment inner" },
			["an"] = { query = "@number.inner", desc = "Number" },
			["in"] = { query = "@number.inner", desc = "Number inner" },
		}

		for key, obj in pairs(keymaps) do
			vim.keymap.set({ "x", "o" }, key, function()
				select.select_textobject(obj.query, "textobjects")
			end, { desc = obj.desc })
		end
	end,
}
