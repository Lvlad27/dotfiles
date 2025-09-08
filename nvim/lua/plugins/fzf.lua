return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = {
        preview = {
          hidden = true,
        },
      },
      keymap = {
        -- Binds for fzf's internal behavior go in the 'fzf' table
        fzf = {
          ["ctrl-j"] = "ignore", -- Optional: unbind the default C-j
          ["ctrl-k"] = "ignore", -- Optional: unbind the default C-k
          ["alt-j"] = "down", -- Map Alt+j to move down
          ["alt-k"] = "up", -- Map Alt+k to move up
        },
      },
    },
  },
}
