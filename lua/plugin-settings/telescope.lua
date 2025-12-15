local status_ok, t = pcall(require, "telescope")
if not status_ok then
  return
end

t.setup({
})

local h = require("helpers")
local keys = {
  { "n", "<Leader>tt", ":Telescope<CR>" },
  { "n", "<Leader>tg", ":Telescope live_grep<CR>" },
  { "n", "<Leader>tf", ":Telescope git_files<CR>" },
  { "n", "<Leader>tF", ":Telescope find_files<CR>" },
}
h.map_keys(keys)

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  { "<leader>t", group = "Telescope" },
  { "<leader>tt", desc = "Main" },
  { "<leader>tg", desc = "Live grep" },
  { "<leader>tf", desc = "Preview hunk" },
  { "<leader>tF", desc = "Side-by-side diff" },
})
