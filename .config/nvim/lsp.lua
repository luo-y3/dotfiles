return {
  -- Mason
  {
    "mason-org/mason.nvim",
    -- FIX: mason ต้อง setup ก่อน mason-lspconfig เสมอ
    priority = 100,
    opts = function(_, opts)
      opts.registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      }

      opts.ensure_installed = opts.ensure_installed or {}

      vim.list_extend(opts.ensure_installed, {
        -- Lua
        "stylua",
        "selene",
        "luacheck",

        -- Shell
        "shellcheck",
        "shfmt",

        -- Web
        "tailwindcss-language-server",
        "css-lsp",
        "html-lsp",
        "vtsls",

        -- Other Languages
        "jdtls",
        "clangd",
        "pyright",
      })

      -- FIX: vim.tbl_unique ไม่มีใน Neovim API → ใช้ตัวกรอง duplicate เอง
      local seen = {}
      local unique = {}
      for _, v in ipairs(opts.ensure_installed) do
        if not seen[v] then
          seen[v] = true
          table.insert(unique, v)
        end
      end
      opts.ensure_installed = unique
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    -- FIX: ระบุ mason เป็น dependency เพื่อให้ lazy.nvim setup ตามลำดับที่ถูกต้อง
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      inlay_hints = {
        enabled = true,
      },

      servers = {
        cssls = {},

        html = {},

        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(
              "tailwind.config.js",
              "tailwind.config.ts",
              "package.json",
              ".git"
            )(...)
          end,
        },

        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },

        vtsls = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git")(...)
          end,

          single_file_support = false,

          settings = {
            typescript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },

            javascript = {
              inlayHints = {
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
          },
        },

        lua_ls = {
          single_file_support = true,

          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },

              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },

              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },

              doc = {
                privateName = { "^_" },
              },

              type = {
                castNumberToInteger = true,
              },

              diagnostics = {
                disable = {
                  "incomplete-signature-doc",
                  "trailing-space",
                  "cannot-infer-type",
                },

                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },

                groupFileStatus = {
                  ambiguity = "Opened",
                  await = "Opened",
                  codestyle = "None",
                  duplicate = "Opened",
                  global = "Opened",
                  luadoc = "Opened",
                  redefined = "Opened",
                  strict = "Opened",
                  strong = "Opened",
                  ["type-check"] = "Opened",
                  unbalanced = "Opened",
                  unused = "Opened",
                },

                unusedLocalExclude = { "_*" },
              },

              format = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
