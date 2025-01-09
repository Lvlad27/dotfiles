return {
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.zenbones = {
        transparent_background = true,
      }
      -- Create autocmd group and command before setting colorscheme
      local grpid = vim.api.nvim_create_augroup("custom_highlights", {})
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = grpid,
        pattern = "*bones",
        command = "hi Comment gui=NONE |"
          .. "hi Constant gui=NONE |"
          .. "hi String gui=NONE |"
          .. "hi Boolean gui=NONE",
      })
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = { keywords = { italic = false } },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = { transparency = false, italic = false },
      })
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = {
      terminal_colors = false, -- add neovim terminal colors
      bold = true,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      transparent_mode = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false, -- Disable setting background
      terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      colorblind = {
        enable = true, -- Enable colorblind support
        simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
        severity = {
          protan = 1, -- Severity [0,1] for protan (red)
          deutan = 0, -- Severity [0,1] for deutan (green)
          tritan = 0, -- Severity [0,1] for tritan (blue)
        },
      },
      styles = { -- Style to be applied to different syntax groups
        comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
    },
  },
  { "Mofiqul/vscode.nvim", lazy = false, priority = 1000, opts = {} },
  { "ficcdaf/ashen.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
  { "olivercederborg/poimandres.nvim", lazy = false, priority = 1000 },
  { "zootedb0t/citruszest.nvim", lazy = false, priority = 1000 },
  { "HoNamDuong/hybrid.nvim", lazy = false, priority = 1000, opts = {} },
  { "p00f/alabaster.nvim", lazy = false, priority = 1000 },
  { "sample-usr/rakis.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
  { "mcauley-penney/ice-cave.nvim", lazy = false, priority = 1000 },
  { "neanias/everforest-nvim", lazy = false, priority = 1000 },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      style = "darker", -- dark/darker, cool/deep, warm/warmer
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      commentStyle = { italic = false },
      theme = "wave", -- wave, lotus, dragon
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
