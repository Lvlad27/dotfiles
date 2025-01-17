-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.api.nvim_create_user_command("CopyBufferInfo", function()
  local relative_path = vim.fn.expand("%")
  local contents = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
  local combined = relative_path .. ":\n\n" .. contents
  vim.fn.setreg("+", combined)
  vim.notify("Buffer path and contents copied to clipboard", vim.log.levels.INFO)
end, {})
map("n", "<C-M-p>", ":CopyBufferInfo<CR>", { desc = "Copy buffer path and contents", silent = true })

-- Remap Ctrl-D and Ctrl-U with centering
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Escape with Ctrl + c
map("i", "<C-c>", "<Esc>")

-- Replacess all instances of the word under the cursor
map("n", "<leader>bs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Quick navigation for errors
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
