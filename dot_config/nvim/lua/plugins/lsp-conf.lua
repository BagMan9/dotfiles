return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      ---@type lspconfig.options
      servers = {
        -- Python
        jedi_language_server = {},
        -- C/C++
        clangd = {
          setup = {
            capabilities = {
              offsetEncoding = { "utf-16" },
            },
          },
        },
        -- HTML
        html = {},
        -- json
        jsonls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
          end,
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
            },
          },
        },
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.flake8,
          nls.builtins.formatting.black.with({
            extra_args = { "--line-length", "79", "--preview" },
          }),
        },
      }
    end,
  },
  {
    "Maan2003/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "flake8",
        "black",
        "jedi-language-server",
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
}
