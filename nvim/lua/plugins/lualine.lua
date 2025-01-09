return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, 2, {
        function()
          local status = require("copilot.api").status.data.status
          return require("copilot.api").status.data.message or ""
        end,
        cond = function()
          local ok, clients = pcall(require, "copilot.api")
          return ok and clients.status.data.status ~= "Normal"
        end,
      })
    end,
  },
}
