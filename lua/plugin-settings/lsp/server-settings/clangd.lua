local common = require("plugin-settings.lsp.server-settings.common_functions")

-- Set encoding to be compatible with NullLS-uncrustify
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
capabilities.document_formatting = false
capabilities.document_range_formatting = false

local function on_attach(client)
  common.default_attach(client)


  -- Remove formatting capability from clangd
  -- client.server_capabilities.documentFormattingProvider = false
  -- client.server_capabilities.documentRangeFormattingProvider = false
end

return {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes"
  }
}
