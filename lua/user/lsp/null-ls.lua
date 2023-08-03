local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup {
  debug = false,
  sources = {
    formatting.prettier.with {
      extra_filetypes = { "toml" },
      extra_args = {
        "--single-quote",
        "--trailing-comma es5",
        "--quote-props as-needed",
      },
    },
    formatting.stylua,
    formatting.trim_newlines,
    formatting.trim_whitespace,

    diagnostics.eslint.with({
      diagnostic_config = {
        update_in_insert = false
      }
    }),
    diagnostics.php,

    code_actions.gitsigns,
    code_actions.eslint,
  },
}
