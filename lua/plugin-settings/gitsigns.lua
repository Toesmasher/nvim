local status_ok, gs = pcall(require, "gitsigns")
if not status_ok then
  return
end

gs.setup({
  attach_to_untracked          = true,
  current_line_blame           = true,
  current_line_blame_opts      = {
    virt_text_pos = 'right_align'
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary> - <abbrev_sha>",
})

-- Brigther blame text
vim.defer_fn(function()
  vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { fg = "#cad3f5" })
end, 500)

local h = require("helpers")
local keys = {
  { "n", "<Leader>gh", ":Gitsigns toggle_linehl<CR>" },
  { "n", "<Leader>gd", ":Gitsigns preview_hunk<CR>" },
  { "n", "<Leader>gD", ":Gitsigns diffthis<CR>", },
  { "n", "<Leader>gn", ":Gitsigns next_hunk<CR>" },
  { "n", "<Leader>gp", ":Gitsigns prev_hunk<CR>" },
  { "n", "<Leader>gr", ":Gitsigns reset_hunk<CR>" },
}
h.map_keys(keys)

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gh", desc = "Toggle line highlight" },
  { "<leader>gd", desc = "Preview hunk" },
  { "<leader>gD", desc = "Side-by-side diff" },
  { "<leader>gn", desc = "Go to next hunk" },
  { "<leader>gp", desc = "Go to prev hunk" },
  { "<leader>gr", desc = "Reset hunk" },
})
