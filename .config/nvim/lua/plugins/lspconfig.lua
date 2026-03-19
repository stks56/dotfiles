return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	opts = {
		servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			gopls = {
				completeUnimported = true,
				analyses = {
					unusedparams = true,
				},
				staticcheck = false,
				gofumpt = true,
			},
			golangci_lint_ls = {},
		},
		textdocument = {
			completion = {
				completionitem = {
					snippetsupport = true,
				},
			},
			foldingrange = {
				dynamicregistration = false,
				linefoldingonly = true,
			},
		},
	},
	config = function(_, opts)
		for server, _ in pairs(opts.servers) do
			vim.lsp.config(server, opts.servers[server])
			vim.lsp.enable(server)
		end
	end,
	version = "*",
}
