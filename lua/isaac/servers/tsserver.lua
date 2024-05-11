-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'package.json')
table.insert(runtime_path, 'src/index.ts')
table.insert(runtime_path, '?.ts')

require("lspconfig").tsserver.setup {
  on_attach = OnAttach,
  capabilities = Capabilities,
  init_options = {
    preferences = {
      quotePreference = 'single'
    },
  },
  ["typescript"] = {
    format = {
      insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
      semicolons = 'remove',
      tabSize = 2
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
}
