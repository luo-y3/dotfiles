return {
  -- { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "css",
        "gitignore",
        "http",
        "json",
        "rust",
      },
    },
  },
}
