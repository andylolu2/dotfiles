return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("user.colorscheme")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    priority = 999,
    opts = {
      default = true,
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("user.nvim-tree")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin",
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_c = {
          "%=",
          {
            "filetype",
            icon_only = true,
            icon = {
              align = "right",
            },
          },
          {
            "filename",
            file_status = false,
            path = 1,
          },
        },
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    init = function()
      vim.keymap.set("x", "<C-_>", ":lua require('Comment.api').toggle()<CR>", opt)
    end,
    config = function()
      require("Comment").setup({
        mappings = {
          basic = false,
          extra = false,
          extended = false,
        },
      })
      --   require("user.comment")
    end,
  },
}
