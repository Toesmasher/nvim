local common = require("plugin-settings.lsp.server-settings.common_functions")

local servers = {
  "clangd",               -- C/C++
  "jdtls",                -- Java
  "jedi_language_server", -- Python
  "rust_analyzer",        -- Rust
  "lua_ls",               -- LUA
}

local default_setup = {
  on_attach = common.default_attach
}

for _, server in ipairs(servers) do
  local cfg_ok, cfg = pcall(require, "plugin-settings.lsp.server-settings." .. server)
  if not cfg_ok then
    cfg = default_setup
  end

  vim.lsp.enable(server)
  vim.lsp.config(server, cfg)
end
