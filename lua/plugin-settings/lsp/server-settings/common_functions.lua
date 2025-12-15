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
    { "n", "<Leader>ld", vim.lsp.buf.declaration },
    -- { "n", "<Leader>ni", vim.lsp.buf.definition },
    { "n", "<Leader>lo", vim.lsp.buf.implementation },
    { "n", "<Leader>lf", vim.lsp.buf.format },

    -- LSP Actions
    { "n", "<Leader>li", ":Telescope lsp_definitions<CR>" },
    { "n", "<Leader>la", vim.lsp.buf.code_action },
    { "n", "<Leader>lx", vim.lsp.buf.rename },
    { "n", "<Leader>lr", ":Telescope lsp_references<CR>" },
    { "n", "<Leader>lc", vim.lsp.buf.hover },
    { "n", "<Leader>lv", toggle_diagnostics },
  }
  h.map_keys(keys)

  local status_ok, wk = pcall(require, "which-key")
  if not status_ok then
    return
  end

  wk.add({
    { "<leader>l", group = "LSP" },
    { "<leader>ld", desc = "Goto declaration" },
    { "<leader>lo", desc = "Goto implementation" },
    { "<leader>lf", desc = "Format" },

    { "<leader>li", desc = "List definitions" },
    { "<leader>la", desc = "Code action" },
    { "<leader>lx", desc = "Rename" },
    { "<leader>lr", desc = "References" },
    { "<leader>lc", desc = "Hover" },
    { "<leader>lv", desc = "Toggle diagnostics" },
  })
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
