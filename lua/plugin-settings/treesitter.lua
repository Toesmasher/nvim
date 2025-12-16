local status_ok, ts = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

ts.setup({

})

ts.install({
  "bash",
  "c",
  "cpp",
  "css",
  "dockerfile",
  "html",
  "http",
  "java",
  "javascript",
  "json",
  "json5",
  "llvm",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "rust",
  "vim",
  "yaml",
  "zig"
})

--local h = require("helpers")
--local o = {
--  foldlevel = 5,
--  foldmethod = "expr",
--  foldexpr = "nvim_treesitter#foldexpr()",
--}
--h.set_options(o)
