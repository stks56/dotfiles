return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format()
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt", "goimports", lsp_format = "first" },
			json = { "jq" },
			-- yaml = { "yamlfmt" },
		},
		format_on_save = {
			timeout_ms = 5000,
			quiet = false,
		},
		notify_on_error = true,
		notify_no_formatters = true,
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
			goimportsreviser = {
				command = "goimports-reviser",
				args = {
					"-rm-unused",
					"-imports-order",
					"std,general,company,project",
					"-excludes",
					"*.gen.go",
					"$FILENAME",
				}, -- add -format?
			},
		},
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	version = "*",
}
