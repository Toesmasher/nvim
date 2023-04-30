local common = require('plugin-settings.lsp.server-settings.common_functions')

-- Add nvim and plugins
local libs = vim.api.nvim_get_runtime_file('', true)
table.insert(libs, vim.fn.expand('$VIMRUNTIME/lua'))

return {
  on_attach = common.default_attach,
  settings = {
    Lua = {
      runtime = {
        runtime = {
          version = 'LuaJIT',
        },
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
}
