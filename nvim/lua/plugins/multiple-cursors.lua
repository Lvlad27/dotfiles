-- Create a file at ~/.config/nvim/lua/plugins/multiple-cursors.lua
return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*", -- Use the latest tagged version
  opts = {
    -- Set up hooks to disable potentially conflicting plugins when using multiple cursors
    pre_hook = function()
      -- Disable features that might interfere with multiple cursors
      vim.opt.cursorline = false
      -- Uncomment these if you have the plugins:
      -- vim.cmd("NoMatchParen")
      -- require('nvim-autopairs').disable()
      -- require("cmp").setup({enabled=false})
    end,
    post_hook = function()
      -- Re-enable features after exiting multiple cursors
      vim.opt.cursorline = true
      -- Uncomment these if you have the plugins:
      -- vim.cmd("DoMatchParen")
      -- require('nvim-autopairs').enable()
      -- require("cmp").setup({enabled=true})
    end,
    -- Add custom key mappings if needed
    custom_key_maps = {
      -- Example for supporting commenting with multiple cursors
      -- {{"n", "i"}, "<C-/>", function() vim.cmd("normal gcc") end},
      -- {"v", "<C-/>", function() vim.cmd("normal gc") end},
    },
  },
  keys = {
    { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
    { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },
    { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
    { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },
    { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },
    { "<Leader>m", "<Cmd>MultipleCursorsAddVisualArea<CR>", mode = { "x" }, desc = "Add cursors to visual area lines" },
    { "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to matches" },
    {
      "<Leader>d",
      "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
      mode = { "n", "x" },
      desc = "Add cursor and jump to next match",
    },
    { "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
  },
}
