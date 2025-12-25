# Neovim Configuration

Personal **Neovim** configuration written in **Lua**, designed to be modular, fast, and maintainable.
It uses **lazy.nvim** as the plugin manager and provides a modern development environment with LSP,
autocompletion, formatting, and Git integration.

---

## ✨ Features

- Modular Lua-based configuration
- `lazy.nvim` plugin management
- Built-in LSP support with Mason
- Autocompletion with `nvim-cmp` + LuaSnip
- Treesitter-based syntax highlighting
- Telescope-powered fuzzy finding
- Clean and extensible structure

---

## 📁 Project Structure

```
nvim/
├─ init.lua
├─ lazy-lock.json
└─ lua/carles/
   ├─ core/
   │  ├─ init.lua
   │  ├─ options.lua
   │  └─ keymaps.lua
   ├─ functions/
   ├─ plugins/
   └─ lazy.lua
```

---

## 🔌 Main Plugins

- **lazy.nvim** – Plugin manager
- **nvim-lspconfig** + **mason.nvim** – Language Server Protocol
- **nvim-cmp** + **LuaSnip** – Autocompletion & snippets
- **telescope.nvim** – Fuzzy finder
- **nvim-treesitter** – Syntax highlighting
- **neo-tree.nvim** – File explorer
- **lualine.nvim** – Statusline
- **gitsigns.nvim** – Git integration
- **which-key.nvim** – Keymap discovery

Plugin versions are pinned via `lazy-lock.json` for reproducibility.

---

## ⌨️ Keymaps

Keymaps are defined in:

```
lua/carles/core/keymaps.lua
```

Highlights:

- `gd` → Go to definition (Telescope)
- `gR` → References
- `K` → Hover documentation
- `<leader>ca` → Code actions
- `<leader>rn` → Rename symbol
- `<leader>d` → Line diagnostics

---

## 🎨 UI / UX

- Colorscheme configured in `plugins/colorscheme.lua`
- Statusline via `lualine.nvim`
- Notifications using `nvim-notify`
- Enhanced UI prompts with `dressing.nvim`

---

## 🧠 LSP

- Automatic LSP server installation via Mason
- Centralized configuration in `plugins/lsp.lua`
- Custom handlers for:
  - `lua_ls`
  - `eslint`

---

## 🧪 Custom Utilities

The `lua/carles/functions/` directory contains small utilities such as:

- switch/case helpers
- commands with arguments

These are lightweight alternatives to external plugins.

---

## 🔄 Updating

Inside Neovim:

```vim
:Lazy sync
```

Clean unused plugins:

```vim
:Lazy clean
```
