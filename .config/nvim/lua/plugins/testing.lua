return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
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
				require("neotest").run.run()
			end,
			desc = "Run all tests (neotest)",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open()
			end,
			desc = "Open test output",
		},
		{
			"<leader>tp",
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
}
