local status_ok, nt = pcall(require, "neo-tree")
if not status_ok then
  return
end

local h = require("helpers")

nt.setup({
  close_if_last_window = true,
})

local keys = {
  { "n", "<Leader>f", ":Neotree toggle<CR>" },
}
h.map_keys(keys)
