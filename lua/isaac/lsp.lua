-- Diagnostic keymaps
vim.keymap.set('n', '<leader>lk', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>lj', vim.diagnostic.goto_next)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Setup mason so it can manage external tooling
require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Enable the following language servers
local servers = { 'rust_analyzer', 'pyright', 'tsserver', 'gopls', 'lua_ls', 'cssls', 'tailwindcss' }

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- Turn on lsp status information
require('fidget').setup({
  notification = {
    window = {
      winblend = 0
    }
  }
})

require "isaac.servers"

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' })

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- Use LspKind
local lspkind = require('lspkind')

cmp.setup {
  view = {
    entries = "native",
    auto_open = true
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = "neorg" },
  },
  -- Configuring LspKind
  formatting = {
    format = lspkind.cmp_format({
      mode = 'text_symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      show_labelDetails = true,

      before = function(entry, vim_item)
        return vim_item
      end
    })
  }
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sh',
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
  end,
})
--
require('lint').linters_by_ft = {
  markdown = { 'vale' },
  html = { 'vale' },
  zsh = { 'zsh' },
  python = { 'ruff', 'mypy' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
}
