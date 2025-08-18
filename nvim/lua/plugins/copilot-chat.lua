return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      modle = "claude-sonnet-4",
      auto_insert_mode = true,
      question_header = "  " .. (vim.env.USER or "User") .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
      prompts = {
        Rewrite = {
          prompt = "Rewrite this using words more suitable for non-native english speakers. If possible, choose short words.",
        },
        Summary = {
          prompt = "Create a single paragraph status report for all the completed todos in this file. Use simple and short words if possible. Structure the status report in bullet points by task, following with the descriptions.\nThis should be the format:\n\nHello! For today:\n\n- Task code: todos gathered in a single paragraph\n- Task code: todos gathered in a single paragraph\n",
        },
        Rename = {
          prompt = "Please rename the variable correctly in given selection based on context.",
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
      { "<leader>cce", ":CopilotChatExplain<cr>", desc = "Copilot - Explain code" },
      { "<leader>ccr", ":CopilotChatRename<cr>", desc = "Copilot - Rename the variable" },
      { "<leader>cct", ":CopilotChatTests<cr>", desc = "Copilot - Generate tests" },
      { "<leader>ccv", ":CopilotChatVisual", mode = "x", desc = "Copilot - Open in vertical split" },
      { "<leader>ccx", ":CopilotChatInline<cr>", mode = "x", desc = "Copilot - Inline chat" },
      { "<leader>ccm", ":CopilotChatCommit<cr>", mode = "x", desc = "Copilot - Generate Commit For Message" },
      { "<leader>ccs", ":CopilotChatCommit<cr>", mode = "x", desc = "Copilot - Generate Commit For Selection" },
      { "<leader>cco", ":CopilotChatOptimize<cr>", mode = "x", desc = "Copilot - Optimize Code" },
      { "<leader>ccf", ":CopilotChatFix<cr>", mode = "x", desc = "Copilot - Optimize Code" },
    },
  },
}
