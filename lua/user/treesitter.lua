local status_ok, treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

treesitter.setup({
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    })
  end
})
