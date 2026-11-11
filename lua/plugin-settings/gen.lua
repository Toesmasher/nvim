local status_ok, gen = pcall(require, "gen")
if not status_ok then
  return
end

gen.setup({
  host = "10.99.0.50",
  port = "11434",
  model = "gemma4:26b"
})
