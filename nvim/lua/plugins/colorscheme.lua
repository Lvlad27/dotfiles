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
    opts = {},
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zenbones",
    },
  },
}
