-- Lua
local format_stylua = require("efmls-configs.formatters.stylua")
local lint_luacheck = require("efmls-configs.linters.luacheck")

local languages = {
	lua = { format_stylua, lint_luacheck },
}

return {
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = false,
		hover = true,
	},
	settings = {
		root_markers = { ".git/" },
		languages = languages,
	},
	filetypes = vim.tbl_keys(languages),
}
