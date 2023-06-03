local options = {
  fileencoding = "utf-8",
  -- clipboard = "unnamedplus",

  hidden = true,
  backup = false,
  writebackup = false,
  swapfile = false,
  errorbells = false,

  number = true,
  relativenumber = true,

  smartindent = true,

  ignorecase = true,
  smartcase = true,
  incsearch = true,
  hlsearch = false,

  wrap = false,
  scrolloff = 4,
  sidescrolloff = 8,

  showcmd = true,
  showmode = false,
  cmdheight = 0,

  pumheight = 10,
  updatetime = 300,

  cursorline = true,
  termguicolors = true,

  confirm = true,

  -- FOLDS
  foldmethod = "syntax",
  foldenable = false,

  -- TABCONFIG
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,

  -- SPLITS
  splitbelow = true,
  splitright = true,

  -- MOUSE SUPPORT
  mouse = "a",
  -- mousemodel = "extend",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.iskeyword:append "-"
vim.opt.formatoptions:remove { 'c', 'r', 'o' }

-- vim.cmd [[filetype plugin off]]
