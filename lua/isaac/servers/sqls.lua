require('lspconfig').sqls.setup {
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
  end,
  cmd = { 'sqls', '-config', '~/.config/sqls/config.yml' }
}
