local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
  return
end

nvim_notify.setup({
  background_colour = "FloatShadow",
  render = "minimal",
})

-- Replace nvim"s notify
vim.notify = nvim_notify
