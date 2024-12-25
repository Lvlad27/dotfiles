return {
  -- Configure LazyVim to load kanagawa
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "kanagawa",
      colorscheme = "terafox",
    },
  },

  -- Kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = false },
      functionStyle = {},
      keywordStyle = { italic = false },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = { -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlighgts
        return {}
      end,
      theme = "wave", -- Load "wave" theme when 'background' option is not set
      background = { -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus",
      },
    },
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      compile = false, -- enable compiling the colorscheme
      transparent = false, -- do not set background color
      dim_inactive = false, -- dim inactive window `:h hl-NormalNC`
      terminal_colors = true, -- define vim.g.terminal_color_{0,17}
      styles = { -- Style to be applied to different syntax groups
        comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
      colorblind = {
        enable = true, -- Enable colorblind support
        simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
        severity = {
          protan = 0, -- Severity [0,1] for protan (red)
          deutan = 0, -- Severity [0,1] for deutan (green)
          tritan = 0, -- Severity [0,1] for tritan (blue)
        },
      },
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
      },
      groups = { -- Custom highlight group overrides
        all = {
          -- Add your overrides here
          -- Example: Normal = { bg = "#000000" }
        },
      },
    },
  },
}
