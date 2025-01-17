return {
  "folke/which-key.nvim",
  opts = {
    spec = {
      {
        mode = "n",
        -- My custom keymaps
        { "<C-M-p>", desc = "Copy buffer path and contents" },
        { "<C-d>", desc = "Scroll down and center" },
        { "<C-u>", desc = "Scroll up and center" },
        { "<leader>bs", desc = "Replace word under cursor" },
      },
    },
  },
}
