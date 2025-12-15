local h = require("helpers")

local function highlightyank()
  vim.highlight.on_yank({
    higroup = "IncSearch",
    timeout = 200
  })
end

local cmds = {
  -- Resize windows on terminal resize
  { "VimResized",   { command = "wincmd =" } },

  -- Add spellcheck for some files
  -- TODO: Figure out how to do setlocal in LUA
  { "FileType",     { pattern = { "text", "markdown", "mail", "gitcommit" }, command = "setlocal spell" } },
  { "FileType",     { pattern = { "text", "markdown", "mail" }, command = "setlocal textwidth=100" } },
  { "FileType",     { pattern = { "text", "markdown", "mail" }, command = "setlocal formatexpr=" } },

  { "TextYankPost", { callback = highlightyank } },
}
h.create_autocmds("ToeAutoCmds", cmds)
