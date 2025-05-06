return {
	"monaqa/dial.nvim",
	keys = {
		{
			"<C-a>",
			function()
				return require("dial.map").inc_normal()
			end,
			expr = true,
			noremap = true,
			desc = "Dial Increment",
		},
		{
			"<C-x>",
			function()
				return require("dial.map").dec_normal()
			end,
			expr = true,
			noremap = true,
			desc = "Dial Decrement",
		},
		{
			"g<C-a>",
			function()
				return require("dial.map").inc_visual()
			end,
			expr = true,
			noremap = true,
			mode = "v",
			desc = "Dial Increment (Visual)",
		},
		{
			"g<C-x>",
			function()
				return require("dial.map").dec_visual()
			end,
			expr = true,
			noremap = true,
			mode = "v",
			desc = "Dial Decrement (Visual)",
		},
		{
			"<C-a>",
			function()
				return require("dial.map").inc_insert()
			end,
			expr = true,
			noremap = true,
			mode = "i",
			desc = "Dial Increment (Insert)",
		},
	},
}
