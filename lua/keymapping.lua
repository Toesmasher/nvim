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

  -- Helix-like movement
  { {"n", "v"}, "gh", "^" },
  { {"n", "v"}, "gl", "$" },

  -- No prefix bindings
  -- Buffer handling
  { "n", "<Tab>",      ":bnext<CR>" },
  { "n", "<S-Tab>",    ":bprevious<CR>" },

  -- Pane handling
  { "n", "<M-h>", ":vertical:resize -5<CR>" },
  { "n", "<M-j>", ":resize -5<CR>" },
  { "n", "<M-k>", ":resize +5<CR>" },
  { "n", "<M-l>", ":vertical:resize +5<CR>" },

  -- Close buffers without losing layout
  { "", "<Leader>bd", ":bp|bd #<CR>" },

  -- Quickfix list
  { "n", "<Leader>qn", ":cnext<CR>" },
  { "n", "<Leader>qp", ":cprevious<CR>" },

  -- Jumps
  { "n", "<Leader>jb", "<C-O>" },
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

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

wk.add({
  { "gh", desc = "Start of line" },
  { "gl", desc = "End of line" },

  { "<Leader>b", group = "Buffers" },
  { "<Leader>bd", desc = "Close buffer" },

  { "<Leader>q", group = "Quickfix" },
  { "<Leader>qn", desc = "Next" },
  { "<Leader>qp", desc = "Previous" },

  { "<Leader>j", group = "Jumps" },
  { "<Leader>jb", desc = "Back" },
})
