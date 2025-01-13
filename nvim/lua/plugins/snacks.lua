return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    indent = {
      enabled = true,
      hl = "SnacksIndent",
    },
    dim = {
      filter = function(buf)
        return false -- This will disable dimming for all buffers
      end,
    },
  },
}
