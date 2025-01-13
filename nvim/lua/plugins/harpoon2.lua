return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
      sync_on_ui_close = true,
      key = function()
        -- Use vim.fn.getcwd() for better compatibility
        return vim.fn.getcwd()
      end,
    },
  },
  config = function(_, opts)
    local harpoon = require("harpoon")

    -- Basic harpoon setup with your opts
    harpoon:setup(opts)

    -- Extended UI configuration for splits and tabs
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end,
  keys = function()
    local keys = {
      -- Existing keymaps
      {
        "<leader>H",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>h",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      -- Navigation between marks
      {
        "[h",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "Harpoon Prev Mark",
      },
      {
        "]h",
        function()
          require("harpoon"):list():next()
        end,
        desc = "Harpoon Next Mark",
      },
      -- Telescope integration
      {
        "<leader>fh",
        function()
          local harpoon = require("harpoon")
          local conf = require("telescope.config").values
          local file_paths = {}
          for _, item in ipairs(harpoon:list().items) do
            table.insert(file_paths, item.value)
          end
          require("telescope.pickers")
            .new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table({
                results = file_paths,
              }),
              previewer = conf.file_previewer({}),
              sorter = conf.generic_sorter({}),
            })
            :find()
        end,
        desc = "Find Harpoon Marks",
      },
    }

    -- Add number-based navigation (1-5)
    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          require("harpoon"):list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end

    return keys
  end,
}
