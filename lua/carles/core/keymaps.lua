vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jj" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Add empty lines before and after cursor in normal mode
keymap.set("n", "gO", "<Cmd>call append(line('.')-1, repeat([''], v:count1))<CR>", { desc = "Insert blank line above" })
keymap.set("n", "go", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Insert blank line below" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- custom functions
keymap.set(
	"n",
	"gs",
	'<cmd>lua require("carles.functions.switch-case").switch_case()<CR>',
	{ desc = "Switch camel/snake case" }
)

-- wezterm command to see keybinds
keymap.set("n", "<leader>ti", "<Cmd>!wezterm show-keys --lua --key-table custom<CR>", { desc = "WezTerm keybinds" })

-- simple notes
keymap.set("n", "<leader>fn", "<Cmd>:SimpleNoteList<CR>", { desc = "Fuzzy find note" })
keymap.set(
	"n",
	"<leader>nn",
	'<cmd>lua require("carles.functions.command-with-args").command_with_args("Enter note title:", "SimpleNoteCreate %s")<CR>',
	{ desc = "New note" }
)
