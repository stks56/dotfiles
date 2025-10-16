local ls = {
	"lua_ls",
}

vim.lsp.enable(ls)

-- local lspconfig = require("lspconfig")
-- lspconfig.gopls.setup({
-- 	settings = {
-- 		gopls = {
-- 			completeUnimported = true,
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 			staticcheck = true,
-- 			gofumpt = true,
-- 		},
-- 	},
-- })
