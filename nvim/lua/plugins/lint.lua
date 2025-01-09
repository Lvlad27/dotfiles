return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          -- Use vim.fn.expand to properly expand the ~ path
          args = { "--config", vim.fn.expand("~/.markdownlint-cli2.yaml"), "--" },
        },
      },
    },
  },
}
