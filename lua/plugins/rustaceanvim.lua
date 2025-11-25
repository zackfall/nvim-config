return {
  'mrcjkb/rustaceanvim',
  version = '^5',
  lazy = false,
  config = function()
    vim.g.rustaceanvim = function()
      local extension_path = vim.env.HOME .. '/.vscode/extensions/vadmincn.vscode-lldb-1.10.0/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb'
      local this_os = vim.uv.os_uname().sysname;

      liblldb_path = liblldb_path .. (this_os == 'Linux' and '.so' or '.dylib')

      local cfg = require('rustaceanvim.config')
      return {
        server = {
          default_settings = {
            ['rust-analyzer'] = {
              checkOnSave = {
                command = 'clippy'
              }
            }
          }
        },
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end
  end
}
