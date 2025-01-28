return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function ()
    local ftMap = {
      vim = 'indent',
      lua = 'indent',
      python = 'indent',
      rust = 'indent',
      javascript = 'indent',
      javascriptreact = 'indent',
      typescript = 'indent',
      typescriptreact = 'indent',
      astro = 'indent',
      css = 'indent',
      scss = 'indent',
      html = 'indent',
      djangotemplate = 'indent',
      toml = 'indent',
      conf = 'indent',
      json = 'indent',
      yaml = 'indent'
    }

    require('ufo').setup({
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
        default = {'imports', 'comments'},
        json = {'array'},
        c = {'comment', 'region'}
      },
      preview = {
        win_config = {
          border = {'', '─', '', '', '', '─', '', ''},
          winhighlight = 'Normal:Folded',
          winblend = 0
        },
        mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = '{',
          jumpBot = '}'
        }
      },
      provider_selector = function (bufnr, filetype, buftype)
        return ftMap[filetype]
      end
    })
  end
}
