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

vim.cmd [[
augroup vimrc-incsearch-highlight
autocmd!
autocmd CmdlineEnter /,\? :set hlsearch
autocmd CmdlineLeave /,\? :set nohlsearch
augroup END
]]

-- vim.opt.iskeyword:append "-"

vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]]               -- highlight yanked text

vim.cmd [[au InsertEnter * silent! set norelativenumber]]                       -- change to absolute numbers on insert mode
vim.cmd [[au InsertLeave * silent! set relativenumber]]                         -- change to relativenumber on exit insert mode

vim.cmd [[au BufWritePre * %s/\s\+$//e]]                                             -- remove trailing spaces
vim.cmd [[au BufEnter * setlocal formatoptions-=cro]]                                -- no auto comment on writing
vim.cmd [[au BufRead,BufNewFile *.java setlocal foldmethod=marker foldmarker={,}]]   -- better folds for java
vim.cmd [[au BufRead,BufNewFile *.ens setlocal filetype=asm]]                        -- better syntax on ens files

-- pdf rendering
vim.cmd [[au Filetype rmd nnoremap <buffer> <leader><leader>r :!Rscript -e "rmarkdown::render('%')"<CR>]]
vim.cmd [[au Filetype tex nnoremap <buffer> <leader><leader>r :!pdflatex % && pdflatex % && rm %:r.log; rm %:r.toc; rm %:r.aux<CR>]]

-- dashboard keybinds
vim.cmd [[
augroup dashboard
autocmd!
au Filetype dashboard nmap <buffer> e :DashboardNewFile<CR>
au Filetype dashboard nmap <buffer> q :qa<CR>
au Filetype dashboard nmap <buffer> <leader>c :cd ~/.config/nvim/ \| SessionLoad<CR>
augroup END
]]

-- vim.cmd [[autocmd InsertEnter * norm zz]]                                       -- centers cursor on screen when writing
