local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local function define_mappings(bufnr)
  local api = require('nvim-tree.api')
  local opts = { buffer = bufnr, noremap = true, silent = true, nowait = true }

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', 'l', api.node.open.edit, opts)
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts)
  vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts)
  vim.keymap.set('n', 'v', api.node.open.vertical, opts)

  -- Create inside folder only if it's open, else create inside parent folder
  local create_callback = function(param)
    local node = api.tree.get_node_under_cursor()

    if vim.fn.isdirectory(node.absolute_path) == 1 and not node.open then
      api.fs.create(node.parent)
    else
      api.fs.create(node)
    end

  end

  vim.keymap.set('n', 'a', create_callback, opts)
end

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  select_prompts = true, -- renders nicely with dressing.nvim
  hijack_cursor = true,
  renderer = {
    root_folder_modifier = ":t",
    highlight_git = "all",
    indent_markers = {
      enable = true,
    },
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
      show = {
        folder_arrow = false
      }
    },
  },
  view = {
    width = 30,
    side = "left",
    adaptive_size = true,
    preserve_window_proportions = true,
    number = true,
    relativenumber = true,
    signcolumn = "no"
  },
  on_attach = define_mappings
}
