return {
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {},
	},
	{
		"khoido2003/roslyn-filewatch.nvim",
		ft = "cs",
		build = "nvim -l build.lua --",
		opts = {
			preset = "auto",
			enable_autorestore = true,
		},
	},
}
