vim.g.enfocado_style = "nature"

-- Search for "pluginIsActivated" in
-- https://github.com/wuelnerdotexe/vim-enfocado/blob/main/colors/enfocado.vim
vim.g.enfocado_plugins = {
  "bufferline",
  "gitsigns",
  "indent-blankline",
  "null-ls",
  "cmp",
  "dap-ui",
  "mason",
  "lspconfig",
  "treesitter",
  "tree",
  "packer",
  "telescope",
}

local colorscheme = "enfocado"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end
