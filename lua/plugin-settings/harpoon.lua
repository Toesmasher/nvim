local h = require('helpers')

local status_ok, harpoon = pcall(require, 'harpoon')
if not status_ok then
  return
end

harpoon:setup({
})

local keys = {
  { 'n', '<Leader>la', function() harpoon:list():add() end },
  { 'n', '<Leader>ll', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
}
h.map_keys(keys)
