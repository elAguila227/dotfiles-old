
local fn = vim.fn

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General Settings", { clear = true })

-- Highlight when yanking
autocmd("TextYankPost", {
  callback = function()
    require("vim.highlight").on_yank { higroup = "Visual", timeout = 200 }
  end,
  group = general,
})

-- Move status line up when on command mode
autocmd("CmdlineEnter", {
  callback = function()
    vim.opt.cmdheight=1
    autocmd("CmdlineLeave", {
      callback = function()
        vim.opt.cmdheight=0
      end,
      group = general,
    })
  end,
  group = general,
})
autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight=1
    autocmd("RecordingLeave", {
      callback = function()
        vim.opt.cmdheight=0
      end,
      group = general,
    })
  end,
  group = general,
})

-- Files with 4 space tab
autocmd("FileType", {
  pattern = { "c", "cpp", "py", "cs" },
  callback = function()
    vim.opt_local.shiftwidth = 4
  end,
  group = general,
})

-- gitcommit improvements
autocmd("FileType", {
  pattern = "gitcommit",
  callback = function()
    vim.opt_local.spell = true
    vim.cmd [[ startinser | 1 ]]
  end,
  group = general,
})

-- Better folds on java
autocmd("FileType", {
  pattern = "java",
  callback = function()
    vim.opt_local.foldmethod = 'marker'
    vim.opt_local.foldmarker = { '{', '}' }
  end,
  group = general,
})

autocmd("FileType", {
  pattern = "rmd",
  callback = function()
    vim.cmd [[ nnoremap <buffer> <leader>r :!Rscript -e \"rmarkdown::render('%')\"<CR> ]]
  end,
  group = general,
})
autocmd("FileType", {
  pattern = "tex",
  callback = function()
    vim.cmd [[ nnoremap <buffer> <leader>r :!pdflatex % && pdflatex % && rm %:r.log; rm %:r.toc; rm %:r.aux<CR> ]]
  end,
  group = general,
})

-- Equalize Splits
autocmd("VimResized", {
  callback = function()
    vim.cmd [[ wincmd = ]]
  end,
  group = general,
})

-- Highlighting match words when searching
autocmd("ModeChanged", {
  callback = function()
    if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
      vim.opt.hlsearch = true
    else
      vim.opt.hlsearch = false
    end
  end,
  group = general,
})

-- Remove trailing spaces
autocmd("BufWritePre", {
  callback = function()
    vim.cmd [[ %s/\s\+$//e ]]
  end,
  group = general,
})

-- Change no absolute numbers on insert
autocmd("InsertEnter", {
  callback = function()
    vim.opt_local.relativenumber = false
    autocmd("InsertLeave", {
      callback = function()
        vim.opt_local.relativenumber = true
      end,
      group = general,
    })
  end,
  group = general,
})

autocmd("FileType", {
  callback = function()
    vim.opt_local.formatoptions:remove { 'c', 'r', 'o' }
  end,
  group = general,
})
-- -- indentline on alpha
-- autocmd("FileType", {
--   pattern = "alpha",
--   callback = function()
--     -- vim.cmd [[ IndentLinesDisable ]]
--     vim.opt.showtabline = 0
--     vim.opt.cmdheight = 0
--     vim.opt.laststatus = 0
--     autocmd("BufUnload", {
--       pattern = "<buffer>",
--       callback = function()
--         vim.opt.showtabline = 2
--         vim.opt.cmdheight = 1
--         vim.opt.laststatus = 2
--       end,
--     })
--   end,
--   group = general,
-- })
