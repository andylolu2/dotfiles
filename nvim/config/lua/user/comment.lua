local comment = require("Comment")

comment.setup()

local api = require("Comment.api")
local opts = { noremap = true, silent = true, nowait = true }

vim.keymap.set("n", "<C-_>", api.toggle.linewise.current, opts)
-- vim.keymap.set("x", "<C-_>", function()
--   vim.api.nvim_feedkeys(esc, "nx", false)
--   api.toggle.linewise(vim.fn.visualmode())
-- end, opt)
