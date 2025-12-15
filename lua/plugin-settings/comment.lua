local status_ok, comment = pcall(require, "Comment")
if not status_ok then
  return
end

comment.setup({
  padding = true, -- Add a space between comment and line
  sticky = true,  -- Cursor retains it"s place
  ignore = nil,   -- Lines to be ignored while commenting
  mappings = {
    basic = true,
    extra = false,
    extended = false,
  },
  toggler = {
    line = "<Leader>cc",
    block = "<Leader>cdonotbind",
  },
  opleader = {
    line = "<Leader>cdonotbind",
    block = "<Leader>cb",
  }
})

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  { "<leader>c", group = "Comment" },
  { "<leader>cc", desc = "Comment line" },
  { "<leader>cb", desc = "Comment block" },
})
