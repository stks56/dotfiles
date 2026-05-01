return {
	"nvim-treesitter/nvim-treesitter",
	commit = "4916d6592ede8c07973490d9322f187e07dfefac",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
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
			"markdown",
			"markdown_inline",
			"nix",
			"query",
			"typescript",
			"vim",
			"vimdoc",
		})

		-- local configs = require("nvim-treesitter.configs")
		--
		-- configs.setup({
		-- 	ensure_installed = {
		-- 		"c",
		-- 		"c_sharp",
		-- 		"elixir",
		-- 		"go",
		-- 		"gomod",
		-- 		"heex",
		-- 		"html",
		-- 		"javascript",
		-- 		"json",
		-- 		"lua",
		-- 		"markdown",
		-- 		"markdown_inline",
		-- 		"nix",
		-- 		"query",
		-- 		"typescript",
		-- 		"vim",
		-- 		"vimdoc",
		-- 	},
		-- 	sync_install = false,
		-- 	highlight = {
		-- 		enable = true,
		-- 	},
		-- 	indent = { enable = false },
		-- }
		-- )
	end,
	version = "*",
}
