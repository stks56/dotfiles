return {
	{
		"h3pei/copy-file-path.nvim",
		opts = {},
		keys = {
			{ "<leader>yy", ":CopyRelativeFilePath<CR>", desc = "Copy relative file path (copy-file-path)" },
			{ "<leader>ya", ":CopyAbsoluteFilePath<CR>", desc = "Copy absolute file path (copy-file-path)" },
			{ "<leader>yf", ":CopyFileName<CR>", desc = "Copy file name (copy-file-path)" },
			{ "<leader>yw", ":CopyWorkspacePath<CR>", desc = "Copy workspace path (copy-file-path)" },
		},
		config = function() end,
		version = "*",
	},
}
