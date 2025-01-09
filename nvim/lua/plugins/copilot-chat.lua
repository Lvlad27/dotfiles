return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      auto_insert_mode = true,
      question_header = "  " .. (vim.env.USER or "User") .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
    },
    build = function()
      vim.notify("Please install 'pip install python-dotenv'")
    end,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
    },
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
      { "<leader>ccv", ":CopilotChatVisual", mode = "x", desc = "CopilotChat - Open in vertical split" },
      { "<leader>ccx", ":CopilotChatInline<cr>", mode = "x", desc = "CopilotChat - Inline chat" },
    },
  },
}
