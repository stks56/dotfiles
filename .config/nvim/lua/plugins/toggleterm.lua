return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{
				"<leader>hh",
				"<cmd>lua _lazygit_toggle()<CR>",
				desc = "Lazygit on terminal(toggeleterm)",
			},
			{
				"<leader>gg",
				function()
					require("toggleterm.terminal").Terminal:new():toggle()
				end,
				desc = "Toggle terminal(toggeleterm)",
			},
		},
		opts = {},
		config = function()
			require("toggleterm").setup({
				direction = "float",
				-- float_opts = {
				-- width = 0.8,
				-- height = 0.8,
				-- winblend = 3,
				-- },
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

			_G._lazygit_toggle = function()
				lazygit:toggle()
			end
		end,
	},
}
