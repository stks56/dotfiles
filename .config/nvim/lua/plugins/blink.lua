return {
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				default = {
					"lsp",
					"lazydev",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			completion = {
				list = {
					selection = {
						preselect = false,
					},
				},
				documentation = {
					auto_show = true,
				},
			},
			keymap = {
				["<CR>"] = { "select_and_accept", "fallback" },
			},
		},
		version = "*",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				"lazy.nvim",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
		version = "*",
	},
}
