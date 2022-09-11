local colorscheme = "pywal"
vim.opt.background = "dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


vim.cmd [[hi CursorLine term=underline cterm=underline gui=underline]]
vim.cmd [[hi VertSplit cterm=NONE gui=NONE guibg=NONE ]]
-- vim.cmd [[hi StatusLineNC cterm=NONE gui=NONE ]]

-- vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
-- vim.cmd [[hi EndOfBuffer guibg=NONE ctermbg=NONE]]
-- vim.cmd [[hi LineNr ctermbg=NONE]]

-- vim.cmd [[hi Folded ctermfg=1 guifg=1]]

