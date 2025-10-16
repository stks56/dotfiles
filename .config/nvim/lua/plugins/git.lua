return {
	{
		"sindrets/diffview.nvim",
		keys = {
			{
				"<leader>hd",
				"<cmd>DiffviewOpen<CR>",
				desc = "Diffview Open (diffview)",
			},
		},
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		keys = {
			{
				"<leader>hs",
				function()
					require("gitsigns").diffthis()
				end,
				desc = "Diffthis (gitsigns)",
			},
		},
		opts = {},
	},
}
