local h = require("helpers")

local status_ok, yazi = pcall(require, "yazi")
if not status_ok then
  return
end
yazi.setup({
  keymaps = {
    change_working_directory = "<c-.>"
  }
})

local keys = {
  { "n", "<Leader>ff", function() yazi.toggle() end },
}

h.map_keys(keys)

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  { "<leader>f", group = "File operations" },
  { "<leader>ff", desc = "Yazi" },
})
