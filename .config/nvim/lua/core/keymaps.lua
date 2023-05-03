local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local vis_opts = { noremap = true }

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
keymap("n", "<leader><leader>q", ":q<CR>", opts)
keymap("n", "<leader>Q", ":qa<CR>", opts)
keymap("v", "<leader>w", ":w<CR>", opts)
keymap("v", "<leader>q", ":Bdelete<CR>", opts)
keymap("v", "<leader><leader>q", ":q<CR>", opts)
keymap("v", "<leader>Q", ":qa<CR>", opts)

-- Better substitude
keymap("n", "s", ":s/", vis_opts)
keymap("n", "S", ":%s/", vis_opts)
keymap("v", "s", ":s/", vis_opts)
keymap("v", "S", ":%s/", vis_opts)

-- Enable spell checking
keymap("n", "<leader>s", ":setlocal spell! spelllang=en<CR>", opts)
keymap("n", "<leader>S", ":setlocal spell! spelllang=es<CR>", opts)

-- Folds
keymap("n", "<leader>a", "za", opts)
keymap("n", "<leader>A", "zA", opts)
keymap("n", "<leader><leader>a", "zR", opts)
keymap("n", "<leader><leader>A", "zM", opts)

-- no cursor movement on line join
keymap("n", "J", "mzJ`z", opts)

-- Insert line
keymap("n", "<A-p>", ":<C-u>call append(line('.'), repeat([''], v:count1))<CR>", opts)
keymap("n", "<A-P>", ":<C-u>call append(line('.')-1, repeat([''], v:count1))<CR><C-e>", opts)

-- Copy paste
keymap("n", "cv", '"+p', opts)
keymap("n", "cV", 'o<ESC>"+p', opts)
keymap("n", "cp", '"+y', opts)
keymap("n", "cP", '"+Y', opts)

keymap("v", "cv", '"+p', opts)
keymap("v", "cV", 'o<ESC>"+p', opts)
keymap("v", "cp", '"+y', opts)
keymap("v", "cP", '"+Y', opts)

keymap("n", "<A-k>", "<C-y>", opts)
keymap("n", "<A-j>", "<C-y>", opts)

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

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- No copy selected text when pasting
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("n", "<A-J>", ":m .+1<CR>==", opts)
keymap("n", "<A-K>", ":m .-2<CR>==", opts)

keymap("v", "J", ":move '>+1<CR><CR>gv=gv", opts)
keymap("v", "K", ":move '<-2<CR><CR>gv=gv", opts)
keymap("v", "<A-J>", ":move '>+1<CR><CR>gv=gv", opts)
keymap("v", "<A-K>", ":move '<-2<CR><CR>gv=gv", opts)

-- PLUGINS --
-- Nvim-Tree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- vimling bindigs
keymap("n", "<leader><leader>d", ":call ToggleDeadKeys()<CR>", opts)
keymap("i", "<leader><leader>d", "<ESC>:call ToggleDeadKeys()<CR>a", opts)
keymap("n", "<leader><leader>i", ":call ToggleIPA()<CR>", opts)
keymap("i", "<leader><leader>i", "<ESC>:call ToggleIPA()<CR>a", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- bufferline
keymap("n", "<A-l>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<A-h>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<A-0>", ":BufferLineTogglePin<CR>", opts)
