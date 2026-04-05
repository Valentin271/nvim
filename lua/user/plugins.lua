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
  use { "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "b9fd5226c2f76c951fc8ed5923d85e4de065e509" } -- Useful lua functions used by lots of plugins
  use { "windwp/nvim-autopairs", commit = "59bce2eef357189c3305e25bc6dd2d138c1683f5" } -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-ts-autotag" }
  use { "numToStr/Comment.nvim", commit = "e30b7f2008e52442154b66f7c519bfd2f1e32acb" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "6141a40173c6efa98242dc951ed4b6f892c97027" }
  use { "nvim-tree/nvim-web-devicons", commit = "40e9d5a6cc3db11b309e39593fc7ac03bb844e38" }
  use { "nvim-tree/nvim-tree.lua", tag = "v1.16.0" }
  use { "akinsho/bufferline.nvim", tag = "v4.9.1" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  use { "akinsho/toggleterm.nvim", tag = "v2.13.1"}
  use { "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" }
  use { "lukas-reineke/indent-blankline.nvim", tag = "v3.9.1" }
  use { "tpope/vim-sleuth", tag = "v2.0" }

  -- Colorschemes
  use { "wuelnerdotexe/vim-enfocado" }

  -- cmp plugins
  use { "hrsh7th/nvim-cmp", commit = "a1d504892f2bc56c2e79b65c6faded2fd21f3eca" } -- The completion plugin
  use { "hrsh7th/cmp-path", commit = "c642487086dbd9a93160e1679a1327be111cbc25" } -- path completions
  use { "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" } -- snippet completions
  use { "hrsh7th/cmp-nvim-lsp", commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef" }
  use { "hrsh7th/cmp-nvim-lua", commit = "e3a22cb071eb9d6508a156306b102c45cd2d573d" }
  use { "hrsh7th/cmp-nvim-lsp-signature-help", commit = "fd3e882e56956675c620898bf1ffcf4fcbe7ec84" }

  -- snippets
  use { "L3MON4D3/LuaSnip", tag = "v2.4.1" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "6cd7280adead7f586db6fccbd15d2cac7e2188b9" } -- a bunch of snippets to use
  use { "b0o/SchemaStore.nvim" }

  -- LSP
  use { "mason-org/mason.nvim", tag = "v2.2.1" }
  use { "mason-org/mason-lspconfig.nvim", tag = "v2.1.0" }
  use { "nvimtools/none-ls.nvim", commit = "6ad251ef07dd4ba0cc725a5553cc76e9923f1a4a" } -- for formatters and linters

  -- Telescope
  use { "nvim-telescope/telescope.nvim", tag = "v0.2.1" }
  use { "stevearc/dressing.nvim", tag = "v2.2.1" } -- Nice select and input
  use { "debugloop/telescope-undo.nvim", commit = "928d0c2dc9606e01e2cc547196f48d2eaecf58e5" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", tag = "v0.10.0" }

  -- Git
  use { "lewis6991/gitsigns.nvim", tag = "v2.1.0" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
