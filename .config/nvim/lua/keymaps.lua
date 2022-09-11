local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode:        "n"
--  insert_mode:        "i"
--  visual_mode:        "v"
--  visual_block_mode:  "x"
--  term_mode:          "t"
--  command_mode:       "c"

-- NORMAL --
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":Bdelete<CR>", opts)
keymap("n", "<leader>Q", ":qa<CR>", opts)

-- Enable spell checking
keymap("n", "<leader>s", ":setlocal spell! spelllang=en<CR>", { noremap = true })
keymap("n", "<leader>S", ":setlocal spell! spelllang=es<CR>", { noremap = true })

-- Folds
keymap("n", "<leader>a", "za", opts)
keymap("n", "<leader>A", "zA", opts)
keymap("n", "<leader><leader>a", "zR", opts)
keymap("n", "<leader><leader>A", "zM", opts)

-- Insert line
keymap("n", "<A-p>", "o<ESC>k", opts)
keymap("n", "<A-P>", "O<ESC>j", opts)

-- Move text up and down
keymap("n", "<A-J>", ":m .+1<CR>==", opts)
keymap("n", "<A-K>", ":m .-2<CR>==", opts)

-- Copy paste
keymap("n", "cv", '"+p', opts)
keymap("n", "cV", 'o<ESC>"+p', opts)
keymap("n", "cp", '"+y', opts)
keymap("n", "cP", '"+Y', opts)

keymap("v", "cv", '"+p', opts)
keymap("v", "cV", 'o<ESC>"+p', opts)
keymap("v", "cp", '"+y', opts)
keymap("v", "cP", '"+Y', opts)

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Nvim-Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- No copy selected text when pasting
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)
keymap("v", "<A-J>", ":move '>+1<CR>gv-gv", opts)
keymap("v", "<A-K>", ":move '<-2<CR>gv-gv", opts)

-- PLUGINS --
-- vimling bindigs
keymap("n", "<leader><leader>d", ":call ToggleDeadKeys()<CR>", opts)
keymap("i", "<leader><leader>d", "<ESC>:call ToggleDeadKeys()<CR>a", opts)
keymap("n", "<leader><leader>i", ":call ToggleIPA()<CR>", opts)
keymap("i", "<leader><leader>i", "<ESC>:call ToggleIPA()<CR>a", opts)
