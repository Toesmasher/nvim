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
  { "n", "<Leader>f", function() yazi.toggle() end },
}

h.map_keys(keys)
