local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, '?.html')
table.insert(runtime_path, '?.tsx')

require("lspconfig").html.setup {
  format = {
    templating = true,
    wrapLineLength = 120,
    wrapAttributes = 'auto',
  },
  hover = {
    documentation = true,
    references = true,
  },
}
