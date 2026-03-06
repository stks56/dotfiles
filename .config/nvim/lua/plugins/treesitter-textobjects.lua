return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	branch = "main",
	init = function()
		vim.g.no_plugin_maps = true
	end,
	keymaps = {
		{
			"af",
			"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('af')<CR>",
			desc = "Select around function",
		},
		{
			"if",
			"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('if')<CR>",
			desc = "Select inside function",
		},
		{
			"ac",
			"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('ac')<CR>",
			desc = "Select around class",
		},
		{
			"ic",
			"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('ic')<CR>",
			desc = "Select inside class",
		},
	},
}
