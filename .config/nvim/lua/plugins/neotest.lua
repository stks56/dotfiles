return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"fredrikaverpil/neotest-golang",
		},
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("neotest").setup({
				adapters = {
					require("neotest-golang")({
						go_test_args = { "-v", "-race", "-count=1" },
						dap_go_enabled = false,
					}),
				},
			})
		end,
		keys = {
			{
				"<leader>tt",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run all tests in current file (neotest)",
			},
			{
				"<leader>to",
				function()
					require("neotest").output_panel.toggle()
				end,
				desc = "Toggle test output panel",
			},
			{
				"<leader>ts",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop running test",
			},
		},
		version = "*",
	},
	{
		"andythigpen/nvim-coverage",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			lang = {
				go = {
					coverage_file = vim.fn.getcwd() .. "/coverage.out",
				},
			},
		},
		version = "*",
	},
}
