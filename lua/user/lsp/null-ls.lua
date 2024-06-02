local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local trim_newlines = require("user.lsp.null-ls.trim_newlines")
local trim_whitespace = require("user.lsp.null-ls.trim_whitespace")

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_filetypes = { "toml" },
      extra_args = {
        "--single-quote",
        "--trailing-comma es5",
        "--quote-props as-needed",
      },
    }),
    formatting.stylua,
    trim_newlines,
    trim_whitespace,

    code_actions.gitsigns,
  },
}
