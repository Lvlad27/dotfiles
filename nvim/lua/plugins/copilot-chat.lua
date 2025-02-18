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
      prompts = {
        REWRITE = {
          prompt = "Rewrite this using words more suitable for non-native english speakers. If possible, choose short words.",
        },
        SUMMARY = {
          prompt = "Create a single paragraph status report for all the completed todos in this file. Use simple and short words if possible. Structure the status report in bullet points by task, following with the descriptions.\nThis should be the format:\n\nHello! For today:\n\n- Task code: todos gathered in a single paragraph\n- Task code: todos gathered in a single paragraph\n",
        },
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
