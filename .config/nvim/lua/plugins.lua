-- Automatically install packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here

  use "windwp/nvim-autopairs"
  use "numToStr/Comment.nvim"
  use "windwp/nvim-ts-autotag"

  use "LukeSmithxyz/vimling"

  -- toggleterm
  use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
  require("toggleterm").setup()
  end}

  -- surround
  use "tpope/vim-surround"

  -- nvim-tree
  use { "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons"         -- icon support
  }

  -- use "mhinz/vim-startify"
  -- use "glepnir/dashboard-nvim"
  -- use {
  --   'goolord/alpha-nvim',
  --   config = function ()
  --     require'alpha'.setup(require'alpha.themes.dashboard'.config)
  --   end
  -- }

  -- -- telescope
  -- use {
  --   'nvim-telescope/telescope.nvim', tag = '0.1.0',
  --   -- or                            , branch = '0.1.x',
  --   requires = { {'nvim-lua/plenary.nvim'} }
  -- }

  -- bufferline
  use { 'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'
  }
  use "moll/vim-bbye"                                 -- close buffer without closing window

  -- lualine
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- cmp plugins
  use "hrsh7th/nvim-cmp"                              -- The completion plugin
  use "hrsh7th/cmp-buffer"                            -- buffer completions
  use "hrsh7th/cmp-path"                              -- path completions
  use "hrsh7th/cmp-cmdline"                           -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"                      -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"                          -- LSP completions

  -- snippets
  use "L3MON4D3/luaSnip"                              -- snippet engine
  use "rafamadriz/friendly-snippets"                  -- a bunch of snippets to use

  -- LSP
  use "williamboman/mason.nvim"                       -- enable LSP
  use "williamboman/mason-lspconfig.nvim"             -- enable LSP
  use "neovim/nvim-lspconfig"                         -- enable LSP
  -- use "williamboman/nvim-lsp-installer"               -- simple to use language server installer

  -- Colorschemes
  -- use "dylanaraps/wal.vim"                            -- Pywal nvim colorscheme
  use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "nvim-treesitter/nvim-treesitter-angular"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Pluging management
  use "wbthomason/packer.nvim"                        -- Have packer manage itself

  use "nvim-lua/popup.nvim"                           -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"                         -- Useful lua Functions used by lots of plugins

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
