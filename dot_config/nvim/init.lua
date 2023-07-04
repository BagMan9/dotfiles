-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- LSP Init Stuff
require("lspconfig").jedi_language_server.setup {}
require("lspconfig").ccls.setup {}
