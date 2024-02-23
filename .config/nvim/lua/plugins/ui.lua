return {
  { 'kepano/flexoki-neovim', name = 'flexoki' },
  {
      "mcauley-penney/tidy.nvim",
      config = function ()
          require("tidy").setup {}
      end
  },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "savq/melange-nvim" },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      opts = {
          theme = 'moonfly',
          section_separators = {'', ''},
          component_separators = {'', ''},
          icons_enabled = true,
      },
  },
  {
      "cohama/lexima.vim"
  },
  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}
