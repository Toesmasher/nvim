local common = require("plugin-settings.lsp.server-settings.common_functions")

local function on_attach(client)
  common.default_attach(client)
end

return {
  on_attach = on_attach,
}
