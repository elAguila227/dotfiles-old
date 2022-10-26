local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local cool_diff = {
    "diff",
    colored = false,
    symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    cond = hide_in_width
}

-- cool function for progress
local cool_progress = function()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    -- local chars = { "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" }
    local chars = { "ﯺ", "ﯸ", "ﯹ" }
    -- local chars = { "" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    -- return chars[index]
    return string.format("%d", line_ratio*100) .. "%% " .. chars[index]
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'pywal-nvim',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    -- component_separators = { left = '|', right = '|'},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {
      "alpha",
      "dashboard",
      "NvimTree",
      "Outline",
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', cool_diff, 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {},
    lualine_z = {'location', cool_progress}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}
