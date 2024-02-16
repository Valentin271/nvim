local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"


-- HEADER

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.header.opts.hl = "Title"


-- BUTTONS

dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("o", "󰄉 " .. " Oldfiles", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("l", " " .. " Light", ':exec &bg=="light" ? "set bg=dark" : "set bg=light" <CR>'),
  dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}

for _, btn in ipairs(dashboard.section.buttons.val) do
  btn.opts.hl = "Keyword"
  btn.opts.hl_shortcut = "Function"
end


-- FOOTER

dashboard.section.footer.val = function()
  -- version
  local v = vim.version()
  local version = v.major .. "." .. v.minor .. "." .. v.patch

  -- plugins
  local plugins_count = vim.fn.len(packer_plugins)

  -- config date
  local handle = io.popen("cd " .. vim.fn.stdpath("config") .. "; git log -1 --format=%cs")
  local config_date = ""
  if handle then
    config_date = handle:read("l")
    handle:close()
  end

  return {
    "",
    "",
    " " .. version,
    "",
    " " .. plugins_count .. " plugins",
    "",
    " 󰜘" .. config_date,
  }
end
dashboard.section.footer.opts.hl = "Comment"


-- SETUP

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
