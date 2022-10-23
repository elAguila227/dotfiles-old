local status_ok, db = pcall(require, "dashboard")
if not status_ok then
  return
end

local home = os.getenv('HOME')
db.custom_header = {
    '',
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    '',
}
-- -- macos
-- db.preview_command = 'cat | lolcat -F 0.3'
-- -- linux
-- db.preview_command = 'ueberzug'
--
-- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
-- db.preview_file_height = 11
-- db.preview_file_width = 70
db.header_pad = 4
db.center_pad = 4
db.footer_pad = 4
db.session_directory = home .. '/.config/nvim/.sessions'
db.custom_center = {
  {icon = '  ',
  desc = 'New File                                      ',
  shortcut = 'e',
  action ='DashboardNewFile'},
  {icon = 'ﮦ  ',
  desc = 'Recently latest session                 ',
  shortcut = 'SPC s l',
  action ='SessionLoad'},
  {icon = '  ',
  desc = 'Recently opened files                   ',
  action =  'Telescope oldfiles',
  shortcut = 'SPC f o'},
  {icon = '  ',
  desc = 'Find File                               ',
  action = 'Telescope find_files find_command=rg,--hidden,--files',
  shortcut = 'SPC f f'},
  {icon = '  ',
  desc = 'Find word                               ',
  action = 'Telescope live_grep',
  shortcut = 'SPC f w'},
  {icon = '  ',
  desc ='File Browser                             ',
  action =  'NvimTreeOpen',
  shortcut = 'CTRL n'},
  {icon = '  ',
  desc = 'Open Nvim configuration                   ',
  action = 'cd ~/.config/nvim/ | SessionLoad',
  shortcut = 'SPC c'},
  {icon = '  ',
  desc = 'Exit                                          ',
  action = 'qa',
  shortcut = 'q'},
}
