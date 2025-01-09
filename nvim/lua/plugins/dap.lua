return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = "mason.nvim",
    cmd = { "DapInstall", "DapUninstall" },
    opts = {
      automatic_installation = true,
      ensure_installed = {
        "node2", -- Ensure the Node.js debugger is installed
      },
      handlers = {
        node2 = function()
          local dap = require("dap")

          -- Configure node2 adapter with fixed debug port
          dap.adapters["node2"] = {
            type = "executable",
            command = "node",
            args = {
              require("mason-registry").get_package("node-debug2-adapter"):get_install_path()
                .. "/out/src/nodeDebug.js",
            },
          }

          -- Add configurations for JavaScript/TypeScript
          for _, language in ipairs({ "typescript", "javascript" }) do
            dap.configurations[language] = {
              {
                name = "Attach to Node.js (9229)",
                type = "node2",
                request = "attach",
                port = 9229,
                address = "localhost",
                localRoot = "${workspaceFolder}",
                remoteRoot = "${workspaceFolder}",
                sourceMaps = true,
                protocol = "inspector",
                skipFiles = { "<node_internals>/**" },
                continueOnAttach = true,
              },
              {
                name = "Launch File",
                type = "node2",
                request = "launch",
                program = "${file}",
                cwd = "${workspaceFolder}",
                sourceMaps = true,
                protocol = "inspector",
                console = "integratedTerminal",
              },
            }
          end
        end,
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    keys = {
      {
        "<leader>du",
        function()
          require("dapui").toggle({})
        end,
        desc = "Dap UI",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        desc = "Eval",
        mode = { "n", "v" },
      },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)

      -- Auto open/close UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
}
