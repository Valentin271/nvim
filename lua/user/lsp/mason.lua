local servers = {
	"lua_ls",
	"bashls",
	"jsonls",
	"yamlls",
	"rust_analyzer",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)

local opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
}

for _, server in pairs(servers) do
	vim.lsp.config(server, opts)
	vim.lsp.enable(server)
end
