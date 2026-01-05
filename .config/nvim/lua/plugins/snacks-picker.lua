return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		-- explorer = { enabled = true },
		-- inage = { enabled = false },
		-- indent = { enabled = true },
		-- input = { enabled = true },
		picker = {
			enabled = true,
			-- reverse = true,
		},
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
	},
	keys = {
		-- global
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "Find Files (snacks.picker)",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep({ hidden = true })
			end,
			desc = "Find Grep Files (snacks.picker)",
		},
		-- in current directory
		{
			"<leader>fdf",
			function()
				Snacks.picker.files({ hidden = true, cmd = vim.fn.expand("%:p:h") })
			end,
			desc = "Find Files in current directory (snacks.picker)",
		},
		{
			"<leader>fdg",
			function()
				Snacks.picker.grep({ hidden = true, cmd = vim.fn.expand("%:p:h") })
			end,
			desc = "Find Grep Files in current directory (snacks.picker)",
		},
		-- local
		{
			"<leader>fs",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "Find LSP Symbols (snacks.picker)",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.commands()
			end,
			desc = "Find Commands (snacks.picker)",
		},
	},
}
