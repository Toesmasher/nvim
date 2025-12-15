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

-- Textobjects
local status_ok, tsto = pcall(require, "nvim-treesitter-textobjects")
if not status_ok then
  return
end

local h = require("helpers")
local status_ok, tstosel = pcall(require, "nvim-treesitter-textobjects.select")
if not status_ok then
  return
end

tsto.setup({
  select = {
    lookahead = true,
    include_surrounding_whitespace = false
  }
})

h.map_keys({
  {{ "x", "o" }, "af", function() tstosel.select_textobject("@function.outer", "textobjects") end },
  {{ "x", "o" }, "if", function() tstosel.select_textobject("@function.inner", "textobjects") end },

  {{ "x", "o" }, "al", function() tstosel.select_textobject("@loop.outer", "textobjects") end },
  {{ "x", "o" }, "il", function() tstosel.select_textobject("@loop.inner", "textobjects") end },

  {{ "x", "o" }, "ib", function() tstosel.select_textobject("@block.outer", "textobjects") end },
  {{ "x", "o" }, "ib", function() tstosel.select_textobject("@block.inner", "textobjects") end },

  {{ "x", "o" }, "ac", function() tstosel.select_textobject("@conditional.outer", "textobjects") end },
  {{ "x", "o" }, "ic", function() tstosel.select_textobject("@conditional.inner", "textobjects") end },
})

print("pie")


--local h = require("helpers")
--local o = {
--  foldlevel = 5,
--  foldmethod = "expr",
--  foldexpr = "nvim_treesitter#foldexpr()",
--}
--h.set_options(o)
