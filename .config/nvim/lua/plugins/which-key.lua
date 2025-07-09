return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>f", group = "Fuzzy Finds (Telescope)" },
			{ "<leader>e", group = "Explorer (Oil)" },
			{ "<leader>x", group = "Diagnostics (Trouble)" },
			{ "<leader>j", group = "Block Operations (Treesj)" },
			{ "<leader>v", group = "View (Noneck)" },
			{ "<leader>t", group = "Tests (neotest)" },
			{ "<leader>y", group = "Yanks (copy-file-path)" },
			{ "<leader>l", group = "LSP (builtin)" },
			{ "<leader>a", group = "AI/Claude Code (claudecode.nvim)" },
		})
	end,
	version = "*",
}
