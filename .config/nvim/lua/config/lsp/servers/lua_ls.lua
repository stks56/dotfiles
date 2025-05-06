return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("lua", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
       completion = {
         callSnippet = "Replace"
       }
    },
  },
}
