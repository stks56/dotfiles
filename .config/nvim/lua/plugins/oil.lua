return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
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
