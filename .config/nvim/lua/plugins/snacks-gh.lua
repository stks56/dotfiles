return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		gh = {
			enabled = true,
		},
		picker = {
			enabled = true,
		},
	},
	keys = {
		{
			"<leader>gi",
			function()
				Snacks.picker.gh_issue({ state = "all" })
			end,
			desc = "Github Issues (snacks.gh)",
		},
		{
			"<leader>gp",
			function()
				Snacks.picker.gh_pr({ state = "all" })
			end,
			desc = "Github PullRequest (snacks.gh)",
		},
	},
}
