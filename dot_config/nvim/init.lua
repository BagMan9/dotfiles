-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP Init Stuff
local capabilities = vim.lsp.protocol.make_client_capabilities()
