local status_ok, ntn = pcall(require, "nvim-tmux-navigation")
if not status_ok then
  return
end

ntn.setup({
  keybindings = {
    left = "<C-h>",
    down = "<C-j>",
    up = "<C-k>",
    right = "<C-l>",
  }
})

