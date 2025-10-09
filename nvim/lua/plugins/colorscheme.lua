return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
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
          LineNr = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorLineNr = { bg = "None" },
          CursorColumn = { bg = "None" },
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
          BufferLineBackground = { bg = "None" },
          BufferLineSeparator = { bg = "None" },
        },
      })

      vim.cmd.colorscheme("ayu")
    end,
  },
}
