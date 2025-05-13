return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{
			"<leader>dw",
			function()
				require("oil").open(vim.fn.getcwd())
			end,
			desc = "Oil: Open working directory",
		},
		{
			"<leader>dc",
			function()
				require("oil").open()
			end,
			desc = "Oil: Open current directory",
		},
	},
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = true,
		use_default_keymaps = true,
		view_options = {
			show_hidden = true,
		},
	},
}
