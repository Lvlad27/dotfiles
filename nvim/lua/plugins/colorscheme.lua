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
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      -- Set colorscheme immediately
      -- vim.cmd("colorscheme github_light_colorblind")
      -- Set our custom indent colors
      vim.schedule(function()
        vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#E7EBEF" })
        vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#CED3D9" })
      end)
    end,
  },
  {
    "LazyVim/LazyVim",
    -- opts = { colorscheme = "rose-pine" },
    opts = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          require("lazy").load({ plugins = { "github-theme" } })
          vim.cmd("colorscheme github_light_colorblind")
        end,
      })
      -- Return empty opts to prevent default colorscheme
      return {}
    end,
  },
}
