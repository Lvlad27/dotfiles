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
    options = { transparent = true },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_light_colorblind",
    },
  },
  {
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode_modern").setup({
        cursorline = false,
        transparent_background = true,
        nvim_tree_darker = true,
      })
    end,
  },
}
