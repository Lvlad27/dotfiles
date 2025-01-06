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
          auto_show_delay_ms = 200,
        },
      },
      keymap = {
        preset = "none", -- Don't use any preset
        ["<Tab>"] = { "select_and_accept" },
        ["<S-Tab>"] = { "fallback" },
        ["<C-n>"] = { "select_next" },
        ["<C-p>"] = { "select_prev" },
      },
    },
  },
}
