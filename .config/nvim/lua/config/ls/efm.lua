local stylua = require("efmls-configs.formatters.stylua")
local luacheck = require("efmls-configs.linters.luacheck")
local gofmt = require("efmls-configs.formatters.gofmt")
local golangci_lint = require("efmls-configs.linters.golangci_lint")

local languages = {
	lua = { stylua, luacheck },
	go  = { gofmt, golangci_lint },
}

-- Or use the defaults provided by this plugin
-- check doc/SUPPORTED_LIST.md for the supported languages
--
-- local languages = require('efmls-configs.defaults').languages()

local efmls_config = {
  filetypes = vim.tbl_keys(languages),
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
}

require('lspconfig').efm.setup(vim.tbl_extend('force', efmls_config, {
  -- Pass your custom lsp config below like on_attach and capabilities
  --
  -- on_attach = on_attach,
  -- capabilities = capabilities,
}))

