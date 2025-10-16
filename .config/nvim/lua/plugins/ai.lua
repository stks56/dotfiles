return {
	{
		"coder/claudecode.nvim",
		dependencies = { "folke/snacks.nvim" },
		config = true,
		keys = {
			{
				"<leader>ac",
				"<cmd>ClaudeCode<cr>",
				desc = "Toggle Claude",
			},
			{
				"<leader>af",
				"<cmd>ClaudeCodeFocus<cr>",
				desc = "Focus Claude",
			},
			{
				"<leader>ar",
				"<cmd>ClaudeCode --resume<cr>",
				desc = "Resume Claude",
			},
			{
				"<leader>aC",
				"<cmd>ClaudeCode --continue<cr>",
				desc = "Continue Claude",
			},
			{
				"<leader>ab",
				"<cmd>ClaudeCodeAdd %<cr>",
				desc = "Add current buffer",
			},
			{
				"<leader>as",
				"<cmd>ClaudeCodeSend<cr>",
				mode = "v",
				desc = "Send to Claude",
			},
			{
				"<leader>as",
				"<cmd>ClaudeCodeTreeAdd<cr>",
				desc = "Add file",
				ft = { "NvimTree", "neo-tree", "oil" },
			},
			{
				"<leader>aa",
				"<cmd>ClaudeCodeDiffAccept<cr>",
				desc = "Accept diff",
			},
			{
				"<leader>ad",
				"<cmd>ClaudeCodeDiffDeny<cr>",
				desc = "Deny diff",
			},
		},
	},
	{
		"yetone/avante.nvim",
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"takeshid/avante-status.nvim",
		},
		opts = function()
			return {
				provider = "claude",
				auto_suggestions_provider = "claude",
				behaviour = {
					auto_suggestions = false,
					auto_set_highlight_group = true,
					auto_set_keymaps = false,
					auto_apply_diff_after_generation = false,
					support_paste_from_clipboard = true,
					minimize_diff = true,
					use_cwd_as_project_root = true,
					enable_fastapply = false,
				},
			}
		end,
	},
}
