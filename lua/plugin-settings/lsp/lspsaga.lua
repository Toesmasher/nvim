local status_ok, lspsaga = pcall(require, 'lspsaga')
if not status_ok then
  return
end

lspsaga.setup({
   ui = {
    border = 'rounded',
    winblend = 30,
  },

  finder = {
    keys = {
      expand_or_jump = '<Enter>',
    }
  },

  code_action = {
    extend_gitsigns = true
  },

  lightbulb = {
    enable = true,
    sign = true,
    virtual_text = false,
  },

  symbol_in_winbar = {
    enable = false,
  },
})
