return {
  {
    "luo-y3/zen-sight.nvim",
    config = function()
      require("zen-sight").setup({
        transparent = true,
        -- theme = "zen_night",
        -- theme = "zen_meadow",
      })
      vim.cmd.colorscheme("zen-sight")
    end,
    -- "craftzdog/solarized-osaka.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --   require("solarized-osaka").setup({
    --     transparent = true,
    --   })
    --   vim.cmd.colorscheme("solarized-osaka")
    -- end,
  },
}
