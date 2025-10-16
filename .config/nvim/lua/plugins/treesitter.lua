return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		"yioneko/nvim-yati",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"go",
				"gomod",
				"typescript",
			},
			sync_install = false,
			highlight = {
				enable = true,
			},
			yati = {
				enable = true,
				default_fallback = "auto",
			},
			indent = { enable = false },
		})
	end,
	version = "*",
}
