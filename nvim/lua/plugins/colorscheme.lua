return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = { transparency = true, italic = false },
    },
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "dark", -- or "light"
      background = "hard", -- "soft", "medium", "hard"
    },
    config = function(_, opts)
      vim.o.background = opts.variant
      vim.g.everforest_background = opts.background
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
