local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local status_ngps, ngps = pcall(require, 'nvim-gps')
if status_ngps then
  ngps.setup({
    disable_icons = false,
    icons = {
      ['class-name'] = ' ',
      ['function-name'] = ' ',
      ['method-name'] = ' ',
      ['container-name'] = ' ',
      ['tag-name'] = ' ',
	  },
  })
end


local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local function location()
  local loc = { cond = false }

  if status_ngps then
    loc = {
      ngps.get_location,
      cond = ngps.is_available
    }
  end

  return loc
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  always_visible = true
}

local diff = {
  'diff',
  cond = hide_in_width
}

local branch = {
  'branch',
  icons_enabled = true,
  icon = ''
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000
    }
  },
  -- branch, diagnostics, diff, encoding, filetype, fileformat, location, mode, progress
  sections = {
    lualine_a = { branch },
    lualine_b = { 'diff' },
    lualine_c = { {'filename', path = 1}, location() },
    lualine_x = { 'encoding' },
    lualine_y = { diagnostics, 'filetype' },
    lualine_z = { 'location', 'progress' },
  },
  tabline = {},
  extensions = {}
})
