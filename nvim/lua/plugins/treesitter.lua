return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "javascript",
        "typescript",
        "go",
        "java",
        "html",
        "css",
        "rust",
        "json",
        "gitignore",
        "http",
        "markdown",
      },

      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    },
  },
}
