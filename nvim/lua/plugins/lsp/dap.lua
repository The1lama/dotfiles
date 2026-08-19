---- Only use this file for installing DAPs (Debugger) ----
return {
  {
    "mfussenegger/nvim-dap",
    -- only load the keys if the plugin is loaded
    keys = {
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Add breakpoint at line",
        mode = "n",
      },
      {
        "<leader>dr",
        function()
          require("dap").continue()
        end,
        desc = "Start or continue the debugger",
        mode = "n",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over (Next Line)",
        mode = "n",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into Function",
        mode = "n",
      },
      {
        "<leader>dt",
        function()
          require("dap").step_out()
        end,
        desc = "Setp Out of Function",
        mode = "n",
      },
    }

  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "codelldb" },
      automatic_installation = true,
      handlers = {},
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.after.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
}
