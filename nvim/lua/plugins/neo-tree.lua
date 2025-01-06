return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function() -- Convert opts to a function that returns the configuration
    vim.cmd([[hi NeoTreeNormal guibg=NONE ctermbg=NONE]]) -- Execute the highlight command

    return { -- Return the configuration table
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer
        },
      },
      window = {
        mappings = {
          ["w"] = "open", -- This adds 'w' as a key to open files
          ["<cr>"] = "", -- This disables the enter key mapping
        },
      },
    }
  end,
}
