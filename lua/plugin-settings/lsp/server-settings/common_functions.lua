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

    -- Diagnostics
    { "n", "<Leader>nv", toggle_diagnostics },

    -- Noice
    { "n", "<Leader>nc", vim.lsp.buf.hover },

    -- LSP Saga
    { "n", "<Leader>ni", ":Lspsaga goto_definition<CR>" },
    { "n", "<Leader>na", ":Lspsaga code_action<CR>" },
    { "n", "<Leader>nx", ":Lspsaga rename<CR>" },
    { "n", "<Leader>nr", ":Lspsaga finder<CR>" },
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
