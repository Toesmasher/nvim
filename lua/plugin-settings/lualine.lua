local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
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
    component_separators = {
      left = "│",
      right = "│"
    },
    section_separators = {
      left = "",
      right = ""
    },
    icons_enabled = true,
    theme = 'catppuccin',
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
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
    lualine_x = { 'encoding' },
    lualine_y = { diagnostics, 'filetype' },
    lualine_z = { 'location', 'progress' },
  },

  tabline = {
    lualine_a = {
      {
        'buffers',
        use_mode_colors = true,
        symbols = { alternate_file = '' }
      }
    }
  },

  winbar = {

  },

  extensions = {

  }
})
