-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local current_theme = vim.g.colors_name

    if current_theme == "github_light_colorblind" then
      -- Set the light theme indent colors
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#E7EBEF" })
      vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#CED3D9" })
    end

    if current_theme == "rose-pine" then
      -- Set the dark theme indent colors
      vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#32304a" })
      vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#797593" })
    end
    -- If it's not github_light_colorblind, do nothing to preserve the theme's default colors
  end,
})
