local status_ok, t = pcall(require, "telescope")
if not status_ok then
  return
end

t.setup({
})

local h = require("helpers")
local picker_opts = require("telescope.themes").get_ivy({ winblend = 30 })
local builtin = require("telescope.builtin")

local keys = {
  { "n", "<Leader>tb", function() builtin.buffers(picker_opts) end },
  { "n", "<Leader>tg", function() builtin.live_grep(picker_opts) end },
  { "n", "<Leader>tf", function() builtin.git_files(picker_opts) end },
  { "n", "<Leader>tF", function() builtin.find_files(picker_opts) end },
}
h.map_keys(keys)

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  { "<leader>t", group = "Telescope" },
  { "<leader>tb", desc = "Buffers" },
  { "<leader>tg", desc = "Live grep" },
  { "<leader>tf", desc = "Preview hunk" },
  { "<leader>tF", desc = "Side-by-side diff" },
})
