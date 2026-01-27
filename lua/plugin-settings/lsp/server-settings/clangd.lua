local common = require("plugin-settings.lsp.server-settings.common_functions")

local function on_attach(client)
  common.default_attach(client)

  -- Remove formatting capability from clangd
  -- client.server_capabilities.documentFormattingProvider = false
  -- client.server_capabilities.documentRangeFormattingProvider = false
end

return {
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes"
  }
}
