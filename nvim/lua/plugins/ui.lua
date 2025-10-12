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
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Colors
      local colors = {
        blue = "#80a0ff",
        cyan = "#79dac8",
        black = "#080808",
        white = "#c6c6c6",
        red = "#ff5189",
        violet = "#d183e8",
        grey = "#303030",
      }

      -- Theme
      local bubbles_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.violet },
          b = { fg = colors.white, bg = colors.grey },
          c = { fg = colors.white },
        },
        insert = { a = { fg = colors.black, bg = colors.blue } },
        visual = { a = { fg = colors.black, bg = colors.cyan } },
        replace = { a = { fg = colors.black, bg = colors.red } },
        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.white },
        },
      }

      -- Setup
      require("lualine").setup({
        options = {
          theme = bubbles_theme,
          component_separators = "",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {},
          lualine_y = { "filetype", "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = { "filename" },
          lualine_b = { "branch", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {},
          lualine_y = { "filetype", "progress" },
          lualine_z = { "location" },
        },
        tabline = {},
        extensions = {},
      })
    end,
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
