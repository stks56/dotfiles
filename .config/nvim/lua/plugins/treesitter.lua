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
				"c_sharp",
				"elixir",
				"go",
				"gomod",
				"heex",
				"html",
				"javascript",
				"json",
				"lua",
				"nix",
				"query",
				"typescript",
				"vim",
				"vimdoc",
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
