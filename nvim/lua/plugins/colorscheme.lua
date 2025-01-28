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
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        -- ...
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          -- Ensure theme is loaded
          require("lazy").load({ plugins = { "github-theme" } })

          local hour = tonumber(os.date("%H"))
          local light_start = 7
          local light_end = 18

          if hour >= light_start and hour < light_end then
            vim.opt.background = "light"
            vim.cmd("colorscheme github_light_colorblind")
          else
            vim.opt.background = "dark"
            vim.cmd("colorscheme everforest")
          end
        end,
      })

      -- Return empty opts to prevent default colorscheme
      return {}
    end,
  },
}
