local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, '?.py')

require 'lspconfig'.pyright.setup {}
