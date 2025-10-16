return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>rr",
			'<cmd>lua require("spectre").toggle()<CR>',
			mode = { "n" },
			desc = "Toggle Spectre (spectre)",
		},
		-- {
		-- 	"n",
		-- 	"<leader>rw",
		-- 	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
		-- 	mode = { "n" },
		-- 	desc = "Regexp search current word (spectre)",
		-- },
		-- {
		-- 	"v",
		-- 	"<leader>rw",
		-- 	'<esc><cmd>lua require("spectre").open_visual()<CR>',
		-- 	mode = { "v" },
		-- 	desc = "Regexp search current word (spectre)",
		-- },
		-- {
		-- 	"n",
		-- 	"<leader>rp",
		-- 	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
		-- 	mode = { "n" },
		-- 	desc = "Regexp search on current file (spectre)",
		-- },
	},
	opts = {},
}
