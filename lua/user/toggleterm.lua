local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  size = 15,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
  winbar = {
    enabled = true
  }
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-u>", [[<C-\><C-n><C-u>]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local Terminal = require("toggleterm.terminal").Terminal


-- LAZYGIT

local function _lazygit_on_open()
  -- Asserts esc is available for lazygit to cancel
  vim.api.nvim_buf_del_keymap(0, "t", "<esc>")
end

function _LAZYGIT_TOGGLE()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    on_open = _lazygit_on_open,
    float_opts = {
      border = "curved"
    }
  })
  lazygit:toggle()
end


-- gobang

local function _gobang_on_open()
  -- Asserts esc is available for gobang to cancel
  vim.api.nvim_buf_del_keymap(0, "t", "<esc>")
  -- For possibly future persitent terminal
  -- vim.api.nvim_buf_set_keymap(0, 't', 'q',  "<cmd>lua _GOBANG_TOGGLE()<CR>", { noremap = true })
end

function _GOBANG_TOGGLE()
  local gobang = Terminal:new({
    cmd = "gobang",
    hidden = true,
    direction = "float",
    on_open = _gobang_on_open,
    float_opts = {
      border = "curved"
    }
  })
  gobang:toggle()
end


-- lazydocker

local function _lazydocker_on_open()
  -- Asserts esc is available for lazydocker to cancel
  vim.api.nvim_buf_del_keymap(0, "t", "<esc>")
end

function _LAZYDOCKER_TOGGLE()
  local lazydocker = Terminal:new({
    cmd = "lazydocker",
    hidden = true,
    direction = "float",
    on_open = _lazydocker_on_open,
    float_opts = {
      border = "curved"
    }
  })
  lazydocker:toggle()
end
