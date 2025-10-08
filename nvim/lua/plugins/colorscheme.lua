return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      require("ayu").setup({
        mirage = false, -- Dark mode
        terminal = true,
        -- Make it Transparent
        overrides = {
          Normal = { bg = "None" },
          NormalNC = { bg = "None" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "None" },
          ColorColumn = { bg = "None" },
          SignColumn = { bg = "None" },
          StatusLine = { bg = "None" },
          LineNr = { bg = "None" },
          Folded = { bg = "None" },
          FoldColumn = { bg = "None" },
          CursorLine = { bg = "None" },
          CursorLineNr = { bg = "None" },
          CursorColumn = { bg = "None" },
          VertSplit = { bg = "None" },
          EndOfBuffer = { bg = "None" },
        },
      })
      -- Using a theme
      vim.cmd.colorscheme("ayu")
    end,
  },
}
