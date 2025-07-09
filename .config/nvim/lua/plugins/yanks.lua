return {
	{
		"h3pei/copy-file-path.nvim",
		config = function()
			require("copy-file-path").setup({
				-- ここにオプションを設定できます
				-- 例:
				-- default_absolute = true, -- デフォルトで絶対パスをコピーする
				-- default_relative = false, -- デフォルトで相対パスをコピーしない
				-- show_top_dir = true, -- トップディレクトリを表示する
			})
		end,
		keys = {
			{ "<leader>yy", ":CopyRelativeFilePath<CR>", desc = "Copy relative file path (copy-file-path)" },
			{ "<leader>ya", ":CopyAbsoluteFilePath<CR>", desc = "Copy absolute file path (copy-file-path)" },
			{ "<leader>yf", ":CopyFileName<CR>", desc = "Copy file name (copy-file-path)" },
			{ "<leader>yw", ":CopyWorkspacePath<CR>", desc = "Copy workspace path (copy-file-path)" },
		},
		version = "*",
	},
}
