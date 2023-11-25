local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

local hooks_ok, hooks = pcall(require, "ibl.hooks")
if not hooks_ok then
  return
end

ibl.setup {
  indent = { char = "▏" },
  scope = {
    char = "╎",
    show_start = false,
    show_end = false,
  },
  exclude = {
    filetypes = {
      "help",
      "packer",
      "NvimTree",
    },
    buftypes = {
      "terminal",
      "nofile"
    }
  }
}

hooks.register(
  hooks.type.WHITESPACE,
  hooks.builtin.hide_first_space_indent_level
)
