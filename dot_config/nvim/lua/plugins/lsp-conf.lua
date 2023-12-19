return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      ---@type lspconfig.options
      servers = {},
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
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
