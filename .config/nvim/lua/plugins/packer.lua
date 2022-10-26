local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath "config" .. "/lua/packer_compiled.lua"
-- Automatically install packer
local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer()

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local Packer = augroup("packer_config", { clear = true })

-- Autocommand that reloads neovim whenever you save the plugins.lua file
autocmd("BufWritePost", {
  callback = function()
    vim.cmd [[ source <afile> | PackerSync ]]
  end,
  group = Packer,
  pattern = "packer.lua",
})

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

local packer_compiled_ok, _ = pcall(require, "packer_compiled")
if not packer_compiled_ok then
  vim.notify_once("Please Run :PackerCompile", vim.log.levels.INFO)
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
  compile_path = compile_path
}

local plugins = {
  -- My plugins here
  ["windwp/nvim-autopairs"] = {},
  ["numToStr/Comment.nvim"] = {},
  ["windwp/nvim-ts-autotag"] = {},
  ["kylechui/nvim-surround"] = {},
  ["anuvyklack/pretty-fold.nvim"] = {},
  -- ["lukas-reineke/indent-blankline.nvim"] = {},
  ["Yggdroot/indentLine"] = {
    setup = function()
      vim.g.indentLine_char = '▏'
    end,
  },

  ["LukeSmithxyz/vimling"] = {},
  ["RRethy/vim-hexokinase"] = {
    run = "make hexokinase",
    setup = function()
      vim.g.Hexokinase_highlighters = { 'virtual' }
    end,
  },

  -- toggleterm
  ["akinsho/toggleterm.nvim"] = {},

  -- nvim-tree
  ["kyazdani42/nvim-tree.lua"] = {
    requires = 'kyazdani42/nvim-web-devicons'         -- icon support
  },
  -- bufferline
  ["akinsho/bufferline.nvim"] = {
    requires = 'kyazdani42/nvim-web-devicons',
  },
  -- lualine
  ['nvim-lualine/lualine.nvim'] = {
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  },

  ["moll/vim-bbye"] = {},                                 -- close buffer without closing window

  -- Colorschemes
  ["AlphaTechnolog/pywal.nvim"] = {
    as = 'pywal',
  },

  -- dashboard
  ["goolord/alpha-nvim"] = {},

  -- Git
  ["lewis6991/gitsigns.nvim"] = {},

  -- telescope
  ["nvim-telescope/telescope.nvim"] = {
    requires = { {'nvim-lua/plenary.nvim'} }
  },

  -- cmp plugins
  ["hrsh7th/nvim-cmp"] = {},                              -- The completion plugin
  ["hrsh7th/cmp-buffer"] = {},                            -- buffer completions
  ["hrsh7th/cmp-path"] = {},                              -- path completions
  ["hrsh7th/cmp-cmdline"] = {},                           -- cmdline completions
  ["saadparwaiz1/cmp_luasnip"] = {},                      -- snippet completions
  ["hrsh7th/cmp-nvim-lsp"] = {},                          -- LSP completions

  -- Snippets
  ["L3MON4D3/luaSnip"] = {},                              -- snippet engine
  ["rafamadriz/friendly-snippets"] = {},                  -- a bunch of snippets to use

  -- LSP
  ["williamboman/mason.nvim"] = {},                       -- enable LSP
  ["williamboman/mason-lspconfig.nvim"] = {},             -- enable LSP
  ["neovim/nvim-lspconfig"] = {},                         -- enable LSP

  -- Treesitter
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
  },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {},
  ["nvim-treesitter/nvim-treesitter-angular"] = {},

  -- Extra
  ["nvim-lua/popup.nvim"] = {},                           -- An implementation of the Popup API from vim in Neovim
  ["nvim-lua/plenary.nvim"] = {},                         -- Useful lua Functions used by lots of plugins

  -- Pluging management
  ["wbthomason/packer.nvim"] = {},                        -- Have packer manage itself
}

-- Install your plugins here
return packer.startup(function(use)
  for key, plugin in pairs(plugins) do
    if type(key) == "string" and not plugin[1] then
      plugin[1] = key
    end

    use(plugin)
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    packer.sync()
  end
end)
