return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          -- cond = function()
          -- return not focused
          -- end,
          -- },
          -- view = "notify_send",
          -- opts = { stop = false },
          event = "notify",
        },
        opts = { skip = true },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      background_colour = "Normal",
    },
  },

  -- No close button anymore
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- Status bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "zen_sight",
        -- theme = "solarized_dark",
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "diagnostics", { "filename", path = 1 } },
        lualine_x = { "diff" },
        lualine_y = { "filetype", "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "diagnostics", { "filename", path = 1 } },
        lualine_x = { "diff" },
        lualine_y = { "filetype", "progress" },
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[

███████╗██╗  ██╗███████╗███╗   ██╗ ██████╗ ███╗   ██╗██╗ █████╗ ███╗   ██╗
╚══███╔╝██║  ██║██╔════╝████╗  ██║██╔════╝ ████╗  ██║██║██╔══██╗████╗  ██║
  ███╔╝ ███████║█████╗  ██╔██╗ ██║██║  ███╗██╔██╗ ██║██║███████║██╔██╗ ██║
 ███╔╝  ██╔══██║██╔══╝  ██║╚██╗██║██║   ██║██║╚██╗██║██║██╔══██║██║╚██╗██║
███████╗██║  ██║███████╗██║ ╚████║╚██████╔╝██║ ╚████║██║██║  ██║██║ ╚████║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
   ]],
        },
      },
    },
  },
}
