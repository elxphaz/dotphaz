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
      "cohama/lexima.vim"
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}
