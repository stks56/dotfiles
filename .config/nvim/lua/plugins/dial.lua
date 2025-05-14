return {
	"monaqa/dial.nvim",
	keys = {
		{ "<C-a>", "<Plug>(dial-increment)", mode = { "n", "v" }, remap = true },
		{ "<C-x>", "<Plug>(dial-decrement)", mode = { "n", "v" }, remap = true },
		{ "g<C-a>", "g<Plug>(dial-increment)", mode = { "n", "v" }, remap = true },
		{ "g<C-x>", "g<Plug>(dial-decrement)", mode = { "n", "v" }, remap = true },
	},
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			-- default augends used when no group name is specified
			default = {
				augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
				augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
				augend.constant.alias.bool, -- boolean value (true <-> false)
				augend.semver.alias.semver,
				augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
				augend.constant.new({
					elements = { "&&", "||" },
					word = false,
					cyclic = true,
				}),
			},
		})
	end,
}
