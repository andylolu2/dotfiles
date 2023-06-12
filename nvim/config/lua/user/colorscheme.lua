local colors = require("catppuccin.palettes").get_palette()
require("catppuccin").setup({
  flavour = "macchiato",
  integrations = {
    cmp = true,
    fidget = true,
    gitsigns = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    markdown = true,
    mason = true,
    native_lsp = {
      enabled = true,
    },
    neogit = true,
    neotree = true,
    nvimtree = true,
    symbols_outline = true,
    telescope = true,
    treesitter = true,
    which_key = true,
  },
})

vim.cmd([[ colorscheme catppuccin ]])
