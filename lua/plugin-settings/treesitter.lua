local status_ok, tsconfig = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

tsconfig.setup({
  auto_install = false,
  sync_install = false,
  -- ensure_installed = "maintained",

  ensure_installed = {
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
    -- "latex",
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
  },

  ignore_install = {},
  highlight = { enable = true },
  indent = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Leader>t",
      node_incremental = "n",
      node_decremental = "N",
      scope_incremental = "s",
    }
  },

  -- nvim-treesitter-textobjects specific stuff
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["ic"] = "@conditional.inner",
        ["ac"] = "@conditional.outer",
        ["il"] = "@loop.inner",
        ["al"] = "@loop.outer",
        ["ia"] = "@parameter.inner",
        ["aa"] = "@parameter.outer",
      }
    },
  }
})

--local h = require("helpers")
--local o = {
--  foldlevel = 5,
--  foldmethod = "expr",
--  foldexpr = "nvim_treesitter#foldexpr()",
--}
--h.set_options(o)
