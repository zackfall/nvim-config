-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

local opt = vim.opt

opt.title = true
opt.backup = false
opt.ignorecase = true
opt.wrap = false
opt.backspace = "indent,eol,start"
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("cssls", {
  capabilities = capabilities,
})
vim.lsp.config("hmtl", {
  capabilities = capabilities,
})

vim.lsp.enable("cssls")
vim.lsp.enable("html")
