return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"saghen/blink.cmp",
	},
	opts = {
		servers = {
			lua_ls = {},
			gopls = {
				completeUnimported = true,
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
			},
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
		local lspconfig = require("lspconfig")
		for server, _ in pairs(opts.servers) do
			-- config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(opts)
		end
	end,
	version = "*",
}
