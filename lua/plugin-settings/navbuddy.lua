local h = require('helpers')

local status_ok, navbuddy = pcall(require, 'nvim-navbuddy')
if not status_ok then
  return
end

navbuddy.setup({
  window = {
    border = 'rounded'
  },
  lsp = {
    auto_attach = true
  }
})

local keys = {
  { 'n', '<leader>ns', navbuddy.open }
}
h.map_keys(keys)
