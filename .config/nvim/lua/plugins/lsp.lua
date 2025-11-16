return {
  -- Mason
  {
    "mason-org/mason.nvim",
    cmp = "Mason",
    opts = function(_, opts)
      opts.registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      }

      vim.list_extend(opts.ensure_installed, {
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "rust-analyzer",
        "jdtls",
        "clangd",
        "codelldb",
        "pyright",
        "roslyn",
        "rzls",
      })
    end,
  },

  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {},
  },

  "nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })
  end,
}
