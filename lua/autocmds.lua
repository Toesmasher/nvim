local h = require('helpers')

local function highlightyank()
  vim.highlight.on_yank({
    higroup = 'IncSearch',
    timeout = 200
  })
end

local cmds = {
  -- Reload config files on write
  { 'BufWritePost', { pattern = '*/nvim/*.lua', command = 'source <afile>' } },

  -- Resize windows on terminal resize
  { 'VimResized',   { command = 'wincmd =' } },

  -- Add spellcheck for some files
  -- TODO: Figure out how to do setlocal in LUA
  { 'FileType',     { pattern = { 'text', 'markdown', 'gitcommit' }, command = 'setlocal spell' } },
  { 'FileType',     { pattern = { 'text', 'markdown' }, command = 'setlocal textwidth=100' } },
  { 'FileType',     { pattern = { 'text', 'markdown' }, command = 'setlocal formatexpr=' } },

  { 'TextYankPost', { callback = highlightyank } },
}
h.create_autocmds('ToeAutoCmds', cmds)
