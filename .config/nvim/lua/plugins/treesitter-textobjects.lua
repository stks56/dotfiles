return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	branch = "main",
	init = function()
		vim.g.no_plugin_maps = true
	end,
	config = function()
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
			},
		})

		local select = require("nvim-treesitter-textobjects.select")
		local map = vim.keymap.set

		map({ "x", "o" }, "af", function()
			select.select_textobject("@function.outer", "textobjects")
		end)
		map({ "x", "o" }, "if", function()
			select.select_textobject("@function.inner", "textobjects")
		end)
		map({ "x", "o" }, "ac", function()
			select.select_textobject("@class.outer", "textobjects")
		end)
		map({ "x", "o" }, "ic", function()
			select.select_textobject("@class.inner", "textobjects")
		end)
		map({ "x", "o" }, "aa", function()
			select.select_textobject("@parameter.outer", "textobjects")
		end)
		map({ "x", "o" }, "ia", function()
			select.select_textobject("@parameter.inner", "textobjects")
		end)
	end,
}
