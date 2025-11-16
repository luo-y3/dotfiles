return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", 
      "williamboman/mason-nvim-dap", 
    },
    config = function()
      require("nvim-dap-ui").setup()
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- A. C# / Godot Debug Adapter (Mono)
      -- Godot C# Debug Server รันอยู่ที่พอร์ต 6005
      dap.adapters.mono = {
        type = "server",
        host = "127.0.0.1",
        port = 6005, -- *สำคัญ: ต้องตรงกับ Godot Editor Debug Port*
      }
      dap.configurations.cs = {
        {
          type = "mono",
          name = "Godot C# Attach",
          request = "attach",
        },
      }

      -- B. C++ Debug Adapter (CodeLLDB)
      -- การตั้งค่า CodeLLDB จะถูกจัดการโดย mason-nvim-dap แต่สามารถปรับแต่งได้
      dap.configurations.cpp = {
        {
          name = "Launch Godot C++",
          type = "codelldb",
          request = "launch",
          -- *สำคัญ: ตรงนี้ต้องชี้ไปที่ executable ของ Godot*
          program = function()
            return vim.fn.input(
              "Path to Godot Executable: ",
              vim.loop.cwd() .. "/Godot_v4.5.1-stable_mono_linux.x86_64",
              "file"
            )
          end,
          args = {
            "--path",
            vim.loop.cwd(), -- เปิดโปรเจกต์ปัจจุบัน
            "--debug-adapter-port",
            "6006",
          },
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- Keymaps Debugging
      vim.keymap.set({ "n" }, "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set({ "n" }, "<leader>dc", dap.continue, { desc = "Continue Debug" })
      vim.keymap.set({ "n" }, "<leader>dr", dap.repl.open, { desc = "Open DAP REPL" })
    end,
  },
}
