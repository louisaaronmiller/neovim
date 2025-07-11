vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.number = true          -- Show absolute line number
vim.opt.relativenumber = true  -- Show relative line numbers


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function()
    vim.o.termguicolors = true

    vim.cmd("colorscheme gruvbox")
  end,
},
 {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local builtin = require("telescope.builtin")
    local config_path = vim.fn.stdpath("config") -- = ~/.config/nvim

    -- Corrected key mappings
    vim.keymap.set("n", "<leader>fr", function()
      builtin.find_files({ cwd = config_path })
    end, { desc = "Find files in Neovim config" })

    vim.keymap.set("n", "<leader>fg", function()
      builtin.live_grep()
    end, { desc = "Telescope Live Grep" })
  end,
}, {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      }
    })
    require("telescope").load_extension("ui-select")
  end,
},
{"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
        {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
}, {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'gruvbox_dark',
          section_separators = '',
          component_separators = '',
        },
      })
    end
  },{
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup() 
  end
},

{
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "html"
      }
    })
  end
},

{
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    -- LSP servers
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.ts_ls.setup({})
    lspconfig.html.setup({}) 
    -- LSP keymaps
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  end
}, {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Custom DOOM logo
    dashboard.section.header.val = {
      "=================     ===============     ===============   ========  ========",
      "\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //",
      "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
      "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
      "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
      "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
      "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
      "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
      "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
      "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
      "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
      "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
      "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
      "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
      "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
      "||.=='    _-'                                                     `' |  /==.||",
      "=='    _-'                                                            \\/   `==",
      "\\   _-'                                                                `-_   /",
      " `''                                                                      ``'",
    }

    -- Dashboard buttons (correct commands)
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰉓  Files", ":Neotree toggle<CR>"),
      dashboard.button("r", "󰱼  Find file", ":Telescope find_files<CR>"),
      dashboard.button("t", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
    }

    -- Disable folds
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    -- Optional: Set neutral (non-yellow) header color
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#928374", bg = "NONE" }) -- Gruvbox gray

    alpha.setup(dashboard.opts)
  end,
}





  },
  
  checker = { enabled = true },
})


local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "python", "javascript", "html"},
    highlight = {enable = true},
    indent = {enable = true},
})
-- This creates a keybind SPCff that opens the file directory (neotree) at ~/.config/nvim
vim.keymap.set("n", "<leader>ff", function()
  require("neo-tree.command").execute({
    source = "filesystem",
    action = "show",
    position = "left",
    dir = vim.fn.stdpath("config"), -- opens ~/.config/nvim
  })
end, { desc = "Neo-tree: Open Neovim config" })

-- This will create a keybind to toggle the file directory (neotree)
vim.keymap.set("n", "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true, dir = vim.fn.stdpath("config") })
end, { desc = "Toggle Neo-tree (config dir)" })

vim.opt.clipboard = "unnamedplus" -- This will allow for copy and pasting elsewhere with yank

vim.keymap.set("n", "<leader>hh", function() -- Saves and goes to dash 
  vim.cmd("w")           -- Save the current file
  vim.cmd("Alpha")       -- Go back to the Alpha dashboard
end, { desc = "Save and go to dashboard" })

vim.keymap.set("n", "<leader>r", ":w<CR>:!python3 %<CR>", { desc = "Run current Python file" })

