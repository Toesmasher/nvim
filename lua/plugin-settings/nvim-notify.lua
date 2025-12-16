local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
  return
end

nvim_notify.setup({
  fps = 144,
  stages = "slide"
})

-- Replace nvim"s notify
vim.notify = nvim_notify
