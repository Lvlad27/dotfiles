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
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = { transparent = true },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({ styles = { transparency = true } })
    end,
  },

  {
    "ricardoraposo/nightwolf.nvim",
    lazy = false,
    priority = 1000,
    opts = { transparency = true, theme = "black" },
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = { terminal_colors = false, bold = true, transparent_mode = true },
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
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- Disable setting background
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
    },
  },
  { "Mofiqul/vscode.nvim", lazy = false, priority = 1000, opts = { transparent = true, italic_comments = false } },
  { "ficcdaf/ashen.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
  { "HoNamDuong/hybrid.nvim", lazy = false, priority = 1000, opts = {} },
  { "sample-usr/rakis.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
  { "dgox16/oldworld.nvim", lazy = false, priority = 1000 },
  { "aliqyan-21/darkvoid.nvim", lazy = false, priority = 1000 },
  {
    "tiagovla/tokyodark.nvim",
    opts = { transparent_background = true },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
  {
    "maxmx03/solarized.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = { enabled = true },
      variant = "winter", -- "spring" | "summer" | "autumn" | "winter" (default)
    },
    config = function(_, opts)
      vim.o.termguicolors = true
      vim.o.background = "dark"
      require("solarized").setup(opts)
    end,
  },
  { "sho-87/kanagawa-paper.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { transparent_background = true } },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      theme = "wave", -- wave, lotus, dragon
      transparent = true,
    },
  },
  {
    "mellow-theme/mellow.nvim",
    lazy = false,
    priority = 1000, -- Ensures the colorscheme loads before other plugins
    config = function()
      vim.g.mellow_transparent = true
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "mellow",
    },
  },
}
