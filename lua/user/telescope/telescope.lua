local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = { ".git/", "node_modules" },
    dynamic_preview_title = true, -- Shows the full filepath in preview title

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<A-r>"] = actions.to_fuzzy_refine,
        ["<A-p>"] = actions_layout.toggle_preview,
      },
    },
  },
}
