local tree = require("nvim-tree")

tree.setup()

local api = require("nvim-tree.api")
local opts = { noremap = true, silent = true, nowait = true }

vim.keymap.set("n", "<C-b>", api.tree.toggle, opts)
