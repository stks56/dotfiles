return {
	"pocco81/auto-save.nvim",
	keys = {
		{
			"<leader>bs",
			":ASToggle<CR>",
			desc = "Toggele turning auto save(auto-save)",
		},
	},
	opts = {
		trigger_events = { "InsertLeave", "BufLeave", "FocusLost" },
		debounce_delay = 1000,
	},
}
