return {
  {
    "luo-y3/zen-sight.nvim",
    config = function()
      require("zen-sight").setup({
        transparent = true,
      })
      vim.cmd.colorscheme("zen-sight")
    end,
  },
}
