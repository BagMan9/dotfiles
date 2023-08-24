-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP Init Stuff
require("lspconfig").jedi_language_server.setup {}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })
