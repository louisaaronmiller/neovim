# Neovim Config
<img width="709" alt="image" src="https://github.com/user-attachments/assets/e55b8dd1-ac88-4f8a-b0f1-fe86d40d6992" />

The configuration is contained within a single `init.lua` file rather than being split across a plugin folder.

`git clone https://github.com/louisaaronmiller/neovim.git ~/.config/nvim` To install directly into nvim config folder

------------

# Plugins
[`LazyVim`](https://www.lazyvim.org/installation) Plugin manager

[`Gruvbox`](https://github.com/ellisonleao/gruvbox.nvim) Theme

[`Alpha`](https://github.com/goolord/alpha-nvim) Dashboard

[`Lua-lina`](https://github.com/nvim-lualine/lualine.nvim) Statusline

[`Mason`](https://github.com/mason-org/mason.nvim) LSP config

[`Mason lspconfig`](https://github.com/mason-org/mason-lspconfig.nvim) LSP config

[`Nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) LSP config

[`Neo-tree`](https://github.com/nvim-neo-tree/neo-tree.nvim) File system - sidebars, floating windows, etc.

[`None-ls`](https://github.com/nvimtools/none-ls.nvim) LSP config

[`Nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter) Programming language parser

[`Telescope`](https://github.com/nvim-telescope/telescope.nvim) Fuzzy finder

[`Telescope-ui-select`](https://github.com/nvim-telescope/telescope-ui-select.nvim) Sets vim.ui.select to telescope

[`Which-key`](https://github.com/folke/which-key.nvim) Key binding helper

## 

Some packages like `Telescope`, download other packages like `Plenary` which are requirements for plugins like `Telescope`, `None-ls`, etc. These packages are:

`Nui`

`Nvim-web-devicons`

`Plenary`

# Prerequisites
`git` - Necessary for plugins/github extraction

`nvim` - Hello :3

`grep` - Necessary (i think)

A terminal that supports `True Colour` (i.e. `Kitty`, `iTerm2`, etc) - Necessary for gruvbox (Theme)

`Node.js` - Necessary for LSP config

##
These can all be installed with [Homebrew](https://brew.sh/) using these commands:

`brew install git`

`brew install nvim`

`brew install grep`

`brew install_ --cask _iterm2_.` - Example installation of iTerm2

`brew install node` 

# Installation MacOS/Linux
 - Download the `init.lua` file and store it in `~/.config/nvim/`
 - After installing, within nvim type `:Mason` and install the following (to your choosing)
     - `pyright`         (Python)
     - `ts_ls`           (JavaScript/TypeScript)
     - `black`           (Python)
     - `prettier`        (JavaScript/TypeScript)
     - `css-lsp`         (CSS)
     - `html-lsp`        (HTML)
     - `isort`           (Python)  
     - `stylua`          **REQUIRED**
   
none_ls requires stylua installed in mason

# Things in the future that are being added/fixed
- Rainbow parenthesis
- Line indentation
- Line collapsing
- Surround (plugin)
- Menu (plugin)
- tmux
- things being binded twice (shift + k, displaying two sets of info) (FIXING)




