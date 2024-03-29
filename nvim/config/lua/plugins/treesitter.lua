return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufEnter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
      "windwp/nvim-autopairs",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        endwise = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>", -- maps in normal mode to init the node/scope selection with ctrl+space
            node_incremental = "<C-space>", -- increment to the upper named parent
            node_decremental = "<bs>", -- decrement to the previous node
            scope_incremental = "<noop>", -- increment to the upper scope (as defined in locals.scm)
          },
        },
        auto_install = false,
        ensure_installed = {
          "bash",
          -- "c",
          -- "cpp",
          -- "css",
          "cuda",
          "diff",
          "dockerfile",
          "fish",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore", -- will require tree-sittter-cli
          -- "go",
          "html",
          -- "http",
          "javascript",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          -- "ocaml",
          "python",
          "regex",
          -- "rust",
          -- "scss",
          -- "terraform",
          "toml",
          "vim",
          "yaml",
        },
        textobjects = {
          enable = true,
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.inner",
              ["]p"] = "@parameter.inner",
              ["]c"] = "@class.inner",
            },
            goto_next_end = {
              ["]F"] = "@function.inner",
              ["]P"] = "@parameter.inner",
              ["]C"] = "@class.inner",
            },
            goto_previous_start = {
              ["[f"] = "@function.inner",
              ["[p"] = "@parameter.inner",
              ["[c"] = "@class.inner",
            },
            goto_previous_end = {
              ["[F"] = "@function.inner",
              ["[P"] = "@parameter.inner",
              ["[C"] = "@class.inner",
            },
          },
          select = {
            enable = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",

              ["ac"] = "@conditional.outer",
              ["ic"] = "@conditional.inner",

              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",

              ["av"] = "@variable.outer",
              ["iv"] = "@variable.inner",
            },
          },
        },
      })
    end,
  },
}
