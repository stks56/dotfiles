return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{
			"<leader>ee",
			function()
				require("oil").open()
			end,
			desc = "Explore current directory (Oil)",
		},
		{
			"<leader>ew",
			function()
				require("oil").open(vim.fn.getcwd())
			end,
			desc = "Explore working directory (Oil)",
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
	version = "*",
}
