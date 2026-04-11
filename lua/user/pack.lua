vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim",                       version = "b9fd5226c2f76c951fc8ed5923d85e4de065e509" }, -- Useful lua functions used by lots of plugins
  { src = "https://github.com/windwp/nvim-autopairs",                       version = "59bce2eef357189c3305e25bc6dd2d138c1683f5" }, -- Autopairs, integrates with both cmp and treesitter
  { src = "https://github.com/windwp/nvim-ts-autotag" },
  { src = "https://github.com/numToStr/Comment.nvim",                       version = "e30b7f2008e52442154b66f7c519bfd2f1e32acb" },
  { src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring", version = "6141a40173c6efa98242dc951ed4b6f892c97027" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons",                 version = "40e9d5a6cc3db11b309e39593fc7ac03bb844e38" },
  { src = "https://github.com/nvim-tree/nvim-tree.lua",                     version = "v1.16.0" },
  { src = "https://github.com/akinsho/bufferline.nvim",                     version = "v4.9.1" },
  { src = "https://github.com/moll/vim-bbye",                               version = "25ef93ac5a87526111f43e5110675032dbcacf56" },
  { src = "https://github.com/akinsho/toggleterm.nvim",                     version = "v2.13.1" },
  { src = "https://github.com/ahmedkhalf/project.nvim",                     version = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" },
  { src = "https://github.com/lukas-reineke/indent-blankline.nvim",         version = "v3.9.1" },
  { src = "https://github.com/tpope/vim-sleuth",                            version = "v2.0" },

  { src = "https://github.com/wuelnerdotexe/vim-enfocado" },

  -- cmp plugins
  { src = "https://github.com/hrsh7th/nvim-cmp",                            version = "a1d504892f2bc56c2e79b65c6faded2fd21f3eca" }, -- The completion plugin
  { src = "https://github.com/hrsh7th/cmp-path",                            version = "c642487086dbd9a93160e1679a1327be111cbc25" }, -- path completions
  { src = "https://github.com/saadparwaiz1/cmp_luasnip",                    version = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" }, -- snippet completions
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp",                        version = "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lua",                        version = "e3a22cb071eb9d6508a156306b102c45cd2d573d" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",         version = "fd3e882e56956675c620898bf1ffcf4fcbe7ec84" },

  -- snippets
  { src = "https://github.com/L3MON4D3/LuaSnip",                            version = "v2.4.1" },                                   --snippet engine
  { src = "https://github.com/rafamadriz/friendly-snippets",                version = "6cd7280adead7f586db6fccbd15d2cac7e2188b9" }, -- a bunch of snippets to use
  { src = "https://github.com/b0o/SchemaStore.nvim" },

  -- LSP
  { src = "https://github.com/mason-org/mason.nvim",                        version = "v2.2.1" },
  { src = "https://github.com/neovim/nvim-lspconfig",                       version = "v2.7.0" },
  { src = "https://github.com/nvimtools/none-ls.nvim",                      version = "6ad251ef07dd4ba0cc725a5553cc76e9923f1a4a" }, -- for formatters and linters

  -- Telescope
  { src = "https://github.com/nvim-telescope/telescope.nvim",               version = "v0.2.1" },
  { src = "https://github.com/stevearc/dressing.nvim",                      version = "v2.2.1" }, -- Nice select and input
  { src = "https://github.com/debugloop/telescope-undo.nvim",               version = "928d0c2dc9606e01e2cc547196f48d2eaecf58e5" },

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter",             version = "main" },

  -- Git
  { src = "https://github.com/lewis6991/gitsigns.nvim",                     version = "v2.1.0" },
})
