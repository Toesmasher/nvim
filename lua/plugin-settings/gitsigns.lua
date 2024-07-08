local status_ok, gs = pcall(require, 'gitsigns')
if not status_ok then
  return
end

gs.setup({
  attach_to_untracked          = true,
  current_line_blame           = true,
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary> - <abbrev_sha>',
})

local h = require('helpers')
local keys = {
  { 'n', '<Leader>gh', ':Gitsigns toggle_linehl<CR>' },
  { 'n', '<Leader>gd', ':Gitsigns preview_hunk<CR>' },
  { 'n', '<Leader>gD', ':Gitsigns diffthis<CR>', },
  { 'n', '<Leader>gn', ':Gitsigns next_hunk<CR>' },
  { 'n', '<Leader>gN', ':Gitsigns prev_hunk<CR>' },
  { 'n', '<Leader>gr', ':Gitsigns reset_hunk<CR>' },
}
h.map_keys(keys)
