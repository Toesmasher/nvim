local h = require("helpers")

local g = {
  mapleader = " ",
  maplocalleader = " ",
}
h.set_globals(g)

-- Modes: "n"ormal, "i"nsert, "v"isual, "x"visual_block, "t"erm, "c"ommand
local n_keys = {
  -- Set space as leader
  { "",  "<Space>",    "<Nop>" },

  -- No prefix bindings
  -- Buffer handling
  { "n", "<Leader>c",  ":bd<CR>" },
  { "n", "<Tab>",      ":bnext<CR>" },
  { "n", "<S-Tab>",    ":bprevious<CR>" },

  -- Prefixed bindings
  -- Splitting, Prefix: <Leader>s
  { "",  "s",          "<nop>" },
  { "n", "<Leader>ss", ":split<CR>" },
  { "n", "<Leader>sv", ":vsplit<CR>" },
  { "n", "<Leader>se", ":wincmd =<CR>" },

  { "n", "<M-h>", ":vertical:resize -5<CR>" },
  { "n", "<M-j>", ":resize -5<CR>" },
  { "n", "<M-k>", ":resize +5<CR>" },
  { "n", "<M-l>", ":vertical:resize +5<CR>" },

  -- Quickfix list
  { "n", "<Leader>cn", ":cnext<CR>" },
  { "n", "<Leader>cp", ":cprevious<CR>" },
}

local v_keys = {
  -- Indentation re-select
  { "v", "<", "<gv" },
  { "v", ">", ">gv" },

  -- Move selected lines
  { "v", "J", ":m '>+1<CR>gv=gv"},
  { "v", "K", ":m '<-2<CR>gv=gv"},
}

h.map_keys(n_keys)
h.map_keys(v_keys)
