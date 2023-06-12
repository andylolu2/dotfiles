local options = {
  compatible = false,
  clipboard = "unnamedplus", -- use system clipboard
  hidden = true,
  updatetime = 1000, -- faster update times, default 4000
  mouse = "a",
  inccommand = "split",
  splitbelow = true,
  splitright = true,
  wrap = true,
  wrapmargin = 10,
  textwidth = 0,
  expandtab = true, -- use spaces instead of tabs
  smartindent = true, -- auto indent new lines
  shiftwidth = 2,
  softtabstop = 4,
  tabstop = 4, -- number of spaces a tab counts for
  signcolumn = "yes",
  scrolloff = 10, -- keep 10 lines above and below the cursor
  sidescrolloff = 10,
  number = true,
  relativenumber = true,
  swapfile = false,
  backup = false,
  undofile = true,
  undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir",
  hlsearch = false, -- disable highlight search results
  ignorecase = true,
  incsearch = true,
  ruler = true, -- show the line and column number of the cursor position
  wildmenu = true,
  autoread = true, -- auto reload files when changed outside of vim
  completeopt = { "menu", "menuone", "noselect" },
  colorcolumn = "80",
  backspace = { "indent", "eol", "start" },
  laststatus = 3,
  cursorline = true,
  list = false,
  listchars = "eol:↲,tab:» ,trail:·,extends:<,precedes:>,conceal:┊,nbsp:␣",
  grepprg = "rg --vimgrep --smart-case --follow",
  background = "dark",
  termguicolors = true,
}

vim.opt.shortmess:append("c")
-- vim.opt.nrformats:append("alpha") -- most of the time I dont want this

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.filetype.add({
  extension = {
    tape = "vhs",
  },
})

vim.cmd([[
iabbrev Goreleaser GoReleaser
iabbrev gorelesaer goreleaser
iabbrev carlos0 caarlos0
iabbrev descriptoin description
iabbrev fucn func
iabbrev sicne since
iabbrev emtpy empty
]])
