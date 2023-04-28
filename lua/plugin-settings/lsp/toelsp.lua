local status_ok, toelsp = pcall(require, 'toelsp')
if not status_ok then
  return
end

local h = require('helpers')

toelsp.setup({
  debug = true,
  simple_popup = {
    position = 'cursor'
  }
})

h.create_autocmds('toelspp', {
  {
    { 'CursorHold' },
    { callback = toelsp.requests.hover }
  }
})
