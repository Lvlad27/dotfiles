return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false, -- Disable ghost text
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
        },
        accept = {
          -- Disable auto-brackets functionality
          auto_brackets = {
            enabled = false,
          },
        },
      },
      keymap = {
        preset = "none", -- Don't use any preset
        ["<Tab>"] = { "select_and_accept" },
        ["<S-Tab>"] = { "fallback" },
        ["<A-j>"] = { "select_next" },
        ["<A-k>"] = { "select_prev" },
      },
    },
  },
}
