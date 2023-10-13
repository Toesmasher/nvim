local status_ok, gb = pcall(require, 'catppuccin')
if not status_ok then
  return
end

vim.g.catppuccin_flavour = "macchiato"

gb.setup({
  transparent_background = true,
  compile = {
    enabled = false
  },
})

vim.cmd([[
  color catppuccin
]])
