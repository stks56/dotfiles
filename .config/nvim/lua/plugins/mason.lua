return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		version = "*",
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"luacheck",
				"golangci-lint",
			},
		},
		version = "*",
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		opts = {
			ensure_installed = {
				"efm", -- EFM Language Server (Formatter/Linter連携用)
				"lua_ls", -- Lua Language Server
				"gopls",
			},
		},
		version = "*",
	},
}
