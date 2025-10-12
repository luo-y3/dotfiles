return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1001,
    config = function()
      require("ayu").setup({
        mirage = false,
        terminal = true,
        overrides = {
          -- Basic UI
          Normal = { bg = "None" },
          NormalNC = { bg = "None" },
          SignColumn = { bg = "None" },
          VertSplit = { bg = "None" },
          StatusLine = { bg = "None" },
          LineNr = { fg = "#777666", bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorLineNr = { bg = "None" },
          -- CursorColumn = { bg = "None" },
          EndOfBuffer = { bg = "None" },
          ColorColumn = { bg = "None" },

          -- Floating windows
          NormalFloat = { bg = "None" },
          FloatBorder = { bg = "None" },

          -- Plugin highlights
          NvimTreeNormal = { bg = "None" },
          TelescopeNormal = { bg = "None" },
          TelescopeBorder = { bg = "None" },
          LualineNormal = { bg = "None" },

          -- BufferLine
          BufferLineBackground = { bg = "None" },
          BufferLineSeparator = { bg = "None" },
          BufferLineBufferSelected = { bg = "None" },
          BufferLineCloseButton = { bg = "None" },
          BufferLineCloseButtonSelected = { bg = "None" },
          BufferLineFill = { bg = "None" },
          BufferLineHint = { bg = "None" },
          BufferLineIndicatorSelected = { bg = "None" },
        },
      })

      -- Make Static Cursor color
      -- vim.api.nvim.set_hl(0, "Cursor", { fg = "#888888" })

      -- Make Cursor shapes
      vim.opt.guicursor = table.concat({
        "n-v-c:block-Cursor", -- Normal mode change to Block style
        "i-ci-ve:ver25-Cursor", -- Insert mode change to | style
        "r-cr:hor20-Cursor", -- Replace Horizontal line
        "o:hor50-Cursor", -- Operator pending Horizontal line
      }, ",")

      vim.cmd.colorscheme("ayu")
    end,
  },
}
