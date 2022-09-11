local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

nvim_tree.setup {
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = true,
  ignore_ft_on_setup = {
    "startify",
    "dashboard",
    "alpha",
  },
  open_on_tab = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  filters = {
    dotfiles = true,
  },
  view = {
    adaptive_size = true,
    mappings = {
      custom_only = false,
      list = {
        { key = { "<CR>", "o" }, action = "edit" },
        { key = "O", action = "expand_all" },
        { key = "t", action = "tabnew" },
        { key = "i", action = "toggle_file_info" },
        { key = "v", action = "vsplit" },
        { key = "s", action = "split" },
        { key = "cd", action = "cd" },
      },
    },
  },
  actions = {
    open_file = {
      -- quit_on_open = true
      resize_window = true,
      window_picker = {
        enable = false,
      },
    },
  },
}
vim.cmd [[hi NvimTreeStatusLine cterm=NONE gui=NONE ]]
