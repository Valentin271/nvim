local colorscheme = "darcula"

local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not status_ok then
  return
end

vim.cmd("highlight NvimTreeGitDirty guifg=#1a89e4")
vim.cmd("highlight NvimTreeGitNew guifg=#b34242")
vim.cmd("highlight NvimTreeIndentMarker guifg=#555555")
