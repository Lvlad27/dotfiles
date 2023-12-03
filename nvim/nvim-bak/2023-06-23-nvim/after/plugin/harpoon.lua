local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<F9>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<F10>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<F11>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<F12>", function() ui.nav_file(4) end)

