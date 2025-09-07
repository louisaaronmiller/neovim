return{
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
}, {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
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
}
