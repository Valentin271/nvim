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
  use { "nvim-lua/plenary.nvim", commit = "4f71c0c4a196ceb656c824a70792f3df3ce6bb6d" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "2e8a10c5fc0dcaf8296a5f1a7077efcd37065cc8" } -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-ts-autotag" }
  use { "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" }
  use { "nvim-tree/nvim-web-devicons", tag = "v0.99" }
  use { "nvim-tree/nvim-tree.lua", tag = "v0.100" }
  use { "akinsho/bufferline.nvim", tag = "v4.4.0" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" }
  use { "akinsho/toggleterm.nvim", tag = "v2.8.0"}
  use { "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" }
  use { "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" }
  use { "lukas-reineke/indent-blankline.nvim", tag = "v3.3.7" }
  use { "goolord/alpha-nvim", commit = "1356b9ef31b985d541d94314f2cf73c61124bf1d" }
  use { "tpope/vim-sleuth", tag = "v2.0" }

  -- Colorschemes
  use { "wuelnerdotexe/vim-enfocado" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }
  use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

  -- snippets
  use { "L3MON4D3/LuaSnip", tag = "v2.1.0" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use
  use { "b0o/SchemaStore.nvim" }

  -- LSP
  use { "neovim/nvim-lspconfig", tag = "v0.1.7" } -- enable LSP
  use { "williamboman/mason.nvim", tag = "v1.10.0" }
  use { "williamboman/mason-lspconfig.nvim", tag = "v1.26.0" }
  use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters

  -- Telescope
  use { "nvim-telescope/telescope.nvim", tag = "0.1.4" }
  use { "stevearc/dressing.nvim", tag = "v2.2.0" } -- Nice select and input
  use { "debugloop/telescope-undo.nvim", commit = "d3afc1c105535a90caec092ce27a113f77ba7b84" }
  use { "radyz/telescope-gitsigns", commit = "e568da4b8b6da800bd9274f7b509c0da81fc8615" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", tag = "v0.9.2" }

  -- Git
  use { "lewis6991/gitsigns.nvim", tag = "v0.7" }

  -- DAP
  use { "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" }
  use { "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" }
  use { "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
