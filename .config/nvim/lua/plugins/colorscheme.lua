return {
  {
    "luo-y3/zen-sight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("zen-sight").setup({
        tranparent = true,
      })
      vim.cmd.colorscheme("zen-sight")
    end,
  },
}
