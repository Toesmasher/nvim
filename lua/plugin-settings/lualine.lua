local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  always_visible = true
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = ""
}

local function recording()
  local reg = vim.fn.reg_recording()
  if reg ~= "" then
    print(reg)
    return "Recording @" .. reg
  end

  return ""
end

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
    theme = "catppuccin",
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000
    }
  },
  -- branch, diagnostics, diff, encoding, filetype, fileformat, location, mode, progress
  sections = {
    lualine_a = { branch },
    lualine_b = { "diff" },
    lualine_c = {
      {
        "filename",
        path = 1
      }
    },
    lualine_x = { recording },
    lualine_y = { diagnostics, "filetype" },
    lualine_z = { "location", "progress" },
  },

  tabline = {
    lualine_a = {
      {
        "buffers",
        use_mode_colors = true,
        symbols = { alternate_file = "" }
      }
    }
  },

  winbar = {

  },

  extensions = {

  }
})
