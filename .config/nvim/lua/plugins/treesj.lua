return {
	"Wansmer/treesj",
	keys = {
		{
			"<space>jj",
			function()
				require("treesj").toggle()
			end,
			desc = "Toggle splitting/joining blocks (treesj)",
		},
		{
			"<space>jr",
			function()
				require("treesj").toggle({ split = { recursive = true } })
			end,
			desc = "Toggle recursive splitting/joining blocks (treesj)",
		},
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	opts = {},
	version = "*",
}
