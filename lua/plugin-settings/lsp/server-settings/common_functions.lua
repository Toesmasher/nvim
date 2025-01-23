local h = require("helpers")

local M = {}

local diag_vtext = false
local function toggle_diagnostics()
  diag_vtext = not diag_vtext
  vim.diagnostic.config({
    virtual_text = diag_vtext,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
  })
end

-- Default keybindings
function M.lsp_keybinds()
  local keys = {
    -- LSP Navigation
    { "n", "<Leader>nd", vim.lsp.buf.declaration },
    -- { "n", "<Leader>ni", vim.lsp.buf.definition },
    { "n", "<Leader>no", vim.lsp.buf.implementation },
    { "n", "<Leader>nf", vim.lsp.buf.format },
    { "n", "<Leader>nb", "<C-o>" },

    -- LSP Actions
    { "n", "<Leader>ni", ":Telescope lsp_definitions<CR>" },
    { "n", "<Leader>na", vim.lsp.buf.code_action },
    { "n", "<Leader>nx", vim.lsp.buf.rename },
    { "n", "<Leader>nr", ":Telescope lsp_references<CR>" },
    { "n", "<Leader>nc", vim.lsp.buf.hover },
    { "n", "<Leader>nv", toggle_diagnostics },
  }
  h.map_keys(keys)
end

-- Default AutoCMDs
function M.lsp_autocmd()
  local cmds = {
  }
  h.create_autocmds("ToeLsp", cmds)
end

-- Default attach function
function M.default_attach(client)
  M.lsp_keybinds()
  M.lsp_autocmd()

  toggle_diagnostics()
end

return M
