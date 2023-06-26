local h = require('helpers')

local status_ok, harpoon = pcall(require, 'harpoon')
if not status_ok then
  return
end

local status_ok, mark = pcall(require, 'harpoon.mark')
if not status_ok then
  return
end

local status_ok, ui = pcall(require, 'harpoon.ui')
if not status_ok then
  return
end

harpoon.setup({
  tabline = false,
})

local keys = {
  { 'n', '<Leader>ha', mark.add_file },
  { 'n', '<Leader>hn', ui.toggle_quick_menu },
}
h.map_keys(keys)
