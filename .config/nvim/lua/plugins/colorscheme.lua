-- ~/.config/nvim/lua/plugins/colorscheme.lua

return {
  {
    "luo-y3/zen-respite.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("zen-respite").setup({
        transparent = true,
        -- theme = "zen_clay",
      })
      vim.cmd.colorscheme("zen-respite")
    end,
  },
}

