return {
  {
    "luo-y3/zen-respite.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("zen-respite").setup({
        transparent = true, -- Optional for transparency.
      })
      vim.cmd.colorscheme("zen-respite")
    end,
  },
}
