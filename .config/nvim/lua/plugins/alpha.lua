local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local db = require "alpha.themes.dashboard"
local home = os.getenv('HOME')

db.section.header.val = {
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '',
}
db.section.buttons.val = {
  db.button("e", "  New File",                ":enew <BAR> startinsert<CR>"),
  db.button("r", "ﮦ  Recently Opened Files",   ":Telescope oldfiles<CR>"),
  db.button("f", "  Find File",               ":Telescope find_files<CR>"),
  db.button("w", "  Find Word",               ":Telescope live_grep<CR>"),
  db.button("n", "  File Browser",            ":NvimTreeOpen<CR>"),
  db.button("c", "  Open Nvim Configuration", ":cd ".. home .."/.config/nvim/ <BAR> enew <BAR> NvimTreeOpen<CR>"),
  db.button("q", "  Exit",                    ":qa!<CR>"),
}

local winheight = vim.fn.winheight(0)
local space = winheight - #db.section.buttons.val - (#db.section.header.val*2-3) - #db.section.footer.val
local paddingTop = vim.fn.max({ 0, vim.fn.floor(space*0.40) })
local paddingBut = vim.fn.max({ 0, vim.fn.floor(space*0.25) })
local paddingPlu = vim.fn.max({ 0, vim.fn.floor(space*0.25) })
local paddingEnd = space - paddingTop - paddingBut - paddingPlu

local footer = function()
  local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  if packer_plugins == nil then
    return version
  else
    local total_plugins = "   " .. #vim.tbl_keys(packer_plugins) .. " Plugins"
    return version .. total_plugins
  end
end

db.section.footer.val = footer()

db.config.layout = {
  { type = "padding", val = tonumber(paddingTop)},
  db.section.header,
  { type = "padding", val = tonumber(paddingBut)},
  db.section.buttons,
  { type = "padding", val = tonumber(paddingPlu)},
  db.section.footer,
  { type = "padding", val = tonumber(paddingEnd)},
}

db.section.footer.opts.hl = "AlphaFooter"
db.section.header.opts.hl = "AlphaHeader"
db.section.buttons.opts.hl = "AlphaButton"

db.config.opts.noautocmd = false
alpha.setup(db.config)
