vim.g.enfocado_style = "nature"
vim.g.enfocado_plugins = {
  "bufferline",
  "cmp",
  "dap-ui",
  "gitsigns",
  "indent-blankline",
  "lspconfig",
  "packer",
  "telescope",
  "treesitter",
}

local colorscheme = "enfocado"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end
