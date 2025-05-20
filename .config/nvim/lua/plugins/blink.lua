return {
	"saghen/blink.cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
	opts = {
		sources = {
			default = {
				"lsp",
				"lazydev",
				"path",
				-- "snippets",
				-- "buffer",
			},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
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
		},
	},
	version = "*",
}
