-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_user_command("CopyBufferInfo", function()
  local relative_path = vim.fn.expand("%")
  local contents = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
  local combined = relative_path .. ":\n\n" .. contents
  vim.fn.setreg("+", combined)
  vim.notify("Buffer path and contents copied to clipboard", vim.log.levels.INFO)
end, {})
vim.keymap.set("n", "<C-M-p>", ":CopyBufferInfo<CR>", { desc = "Copy buffer path and contents", silent = true })
