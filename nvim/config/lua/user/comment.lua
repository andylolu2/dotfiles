local comment = require("Comment")

comment.setup()

local api = require("Comment.api")

vim.keymap.set("n", "<C-_>", api.toggle.linewise.current)
vim.keymap.set("x", "<C-_>", function()
  vim.api.nvim_feedkeys(esc, "nx", false)
  api.toggle.linewise(vim.fn.visualmode())
end)
