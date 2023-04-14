local h = require('helpers')

local status_ok, jabs = pcall(require, 'jabs')
if not status_ok then
  return
end

jabs.setup({
  position = 'corner',
  width = 50,
  height = 20,
  border = 'rounded',
  preview_position = 'left',
  offset = {
    bottom = 6,
  }
})

local keys = {
  { 'n', '<Tab>', jabs.open }
}
h.map_keys(keys)
