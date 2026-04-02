return {
	"acidsugarx/babel.nvim",
	version = "*", -- recomended for the latest tag, not main
	opts = {
		target = "ja", -- target language
	},
	keys = {
		{ "<leader>bt", mode = "v", desc = "Translate selection (babel)" },
		{ "<leader>bt", desc = "Translate word (babel)" },
	},
}
