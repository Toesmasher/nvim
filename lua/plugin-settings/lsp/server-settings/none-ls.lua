local status_ok, none_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

local common = require("plugin-settings.lsp.server-settings.common_functions")

none_ls.setup({
  sources = {
    none_ls.builtins.formatting.prettier
  },
  on_attach = common.default_attach
})
