-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'package.json')
table.insert(runtime_path, 'src/index.ts')
table.insert(runtime_path, '?.ts')
table.insert(runtime_path, 'src/index.js')
table.insert(runtime_path, '?.js')

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
    },
    inlayHints = {
      includeInlayParameterNameHints = "literal",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }
  },
  javascript = {
    inlayHints = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
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
