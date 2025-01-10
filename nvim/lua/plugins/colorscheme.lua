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
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
      on_highlights = function(highlights)
        -- Override all possible JSX/TSX highlights
        local jsx_highlights = {
          ["@keyword.jsx"] = { italic = false },
          ["@keyword.tsx"] = { italic = false },
          ["@constructor.jsx"] = { italic = false },
          ["@constructor.tsx"] = { italic = false },
          ["@tag.jsx"] = { italic = false },
          ["@tag.tsx"] = { italic = false },
          ["@type.tsx"] = { italic = false },
          ["@type.builtin.tsx"] = { italic = false },
          ["@function.tsx"] = { italic = false },
          ["@variable.tsx"] = { italic = false },
        }
        for group, settings in pairs(jsx_highlights) do
          highlights[group] = vim.tbl_extend("force", highlights[group] or {}, settings)
        end
      end,
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = { transparency = true, italic = false },
      })
    end,
  },

  {
    "ricardoraposo/nightwolf.nvim",
    lazy = false,
    priority = 1000,
    opts = { transparency = true, italic = false, theme = "black" },
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
  { "Mofiqul/vscode.nvim", lazy = false, priority = 1000, opts = { transparent = true, italic_comments = false } },
  { "ficcdaf/ashen.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
  { "HoNamDuong/hybrid.nvim", lazy = false, priority = 1000, opts = {} },
  { "sample-usr/rakis.nvim", lazy = false, priority = 1000, opts = { transparent = true } },
  { "dgox16/oldworld.nvim", lazy = false, priority = 1000 },
  { "aliqyan-21/darkvoid.nvim", lazy = false, priority = 1000 },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = { transparent = true, commentStyle = { italic = false } },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      no_italic = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      overrides = function()
        return {
          ["@variable.builtin"] = { italic = false },
        }
      end,
      theme = "wave", -- wave, lotus, dragon
      transparent = true,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
}
