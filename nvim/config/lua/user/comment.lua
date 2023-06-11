local comment = require("Comment")

comment.setup({
  mappings = false,
})

local opts = { noremap = false, silent = true, nowait = true }

vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise)", opts)
vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", opt)
