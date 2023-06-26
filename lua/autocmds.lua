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
  { 'FileType',     { pattern = { 'gitcommit', 'markdown' }, command = 'setlocal spell' } },
  { 'FileType',     { pattern = { 'markdown' }, command = 'setlocal textwidth=100' } },

  { 'TextYankPost', { callback = highlightyank } },
}
h.create_autocmds('ToeAutoCmds', cmds)
