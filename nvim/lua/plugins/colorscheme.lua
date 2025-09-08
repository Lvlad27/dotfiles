return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = { italic = false, transparency = true },
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    opts = {
      options = {},
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      transparent = true,
      comments = {},
      keywords = {},
      functions = {},
      variables = {},
    },
    -- "storm"
    -- "moon"
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = { transparent_mode = true },
    italic = {
      strings = false,
      emphasis = false,
      comments = false,
      operators = false,
      folds = false,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-main",
    },
  },
}
