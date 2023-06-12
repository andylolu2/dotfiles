local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Navigate wrapped lines
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
