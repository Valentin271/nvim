local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "lua" }, -- put the language you want in this array
  ignore_install = { "" }, -- List of parsers to ignore installing
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)

  highlight = { enable = true },
  autopairs = { enable = true },
  autotag = { enable = true },
  indent = { enable = true },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "<C-w>",
    },
  }
}
