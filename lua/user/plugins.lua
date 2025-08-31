local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

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
  git = {
    clone_timeout = 300, -- Timeout, in seconds, for git clones
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "857c5ac632080dba10aae49dba902ce3abf91b35" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "6522027785b305269fa17088395dfc0f456cedd2" } -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-ts-autotag" }
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
  use { "nvim-tree/nvim-web-devicons", commit = "f66cdfef5e84112045b9ebc3119fee9bddb3c687" }
  use { "nvim-tree/nvim-tree.lua", tag = "v1.14.0" }
  use { "akinsho/bufferline.nvim", tag = "v4.9.1" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "akinsho/toggleterm.nvim", tag = "v2.13.1"}
  use { "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" }
  use { "lukas-reineke/indent-blankline.nvim", tag = "v3.9.0" }
  use { "tpope/vim-sleuth", tag = "v2.0" }

  -- Colorschemes
  use { "wuelnerdotexe/vim-enfocado" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", tag = "v0.0.2" } -- The completion plugin
  use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help", commit = "031e6ba70b0ad5eee49fd2120ff7a2e325b17fa7" }

  -- snippets
  use { "L3MON4D3/LuaSnip", tag = "v2.3.0" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use
  use { "b0o/SchemaStore.nvim" }

  -- LSP
  use { "neovim/nvim-lspconfig", tag = "v1.7.0" } -- enable LSP
  use { "williamboman/mason.nvim", tag = "v1.11.0" }
  use { "williamboman/mason-lspconfig.nvim", tag = "v1.32.0" }
  use { "nvimtools/none-ls.nvim", commit = "a117163db44c256d53c3be8717f3e1a2a28e6299" } -- for formatters and linters

  -- Telescope
  use { "nvim-telescope/telescope.nvim", tag = "0.1.8" }
  use { "stevearc/dressing.nvim", tag = "v2.2.1" } -- Nice select and input
  use { "debugloop/telescope-undo.nvim", commit = "95b61c01ea3a4c9e8747731148e905bbcf0ccaee" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", tag = "v0.9.3" }

  -- Git
  use { "lewis6991/gitsigns.nvim", tag = "v1.0.2" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
