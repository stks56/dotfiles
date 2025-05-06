local M = {}

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- nvim-cmp を使用する場合:
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
-- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- 各 LSP サーバーに共通の on_attach 関数 (接続時に実行)
local function on_attach(client, bufnr)
  -- ここで LSP 関連のキーマッピングを設定 (config/keymaps.lua に分離しても良い)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true, desc = desc })
  end

  map('n', 'gd', vim.lsp.buf.definition, 'Go to Definition')
  map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
  map('n', 'gi', vim.lsp.buf.implementation, 'Go to Implementation')
  map('n', 'gr', vim.lsp.buf.references, 'Go to References')
  map('n', 'gD', vim.lsp.buf.declaration, 'Go to Declaration')
  map('n', 'gy', vim.lsp.buf.type_definition, 'Go to Type Definition')
  map('n', '<leader>rn', vim.lsp.buf.rename, 'Rename Symbol')
  map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'Code Actions')
  map('n', '<leader>d', vim.diagnostic.open_float, 'Show Line Diagnostics')
  map('n', '[d', vim.diagnostic.goto_prev, 'Go to Previous Diagnostic')
  map('n', ']d', vim.diagnostic.goto_next, 'Go to Next Diagnostic')

  -- フォーマット機能の有効化 (efm などフォーマット機能を持つ LSP)
  if client.supports_method("textDocument/formatting") then
    map('n', '<leader>f', function()
      vim.lsp.buf.format({ bufnr = bufnr, async = true })
    end, 'Format Document')
    -- 保存時フォーマットは autocmds.lua で設定
  end

  -- その他、必要に応じて設定 (例: Inlay Hints)
  -- if client.supports_method("textDocument/inlayHint") then
  --   vim.lsp.inlay_hint.enable(bufnr, true)
  -- end
end

-- LSP 診断 (Diagnostic) の設定 (アイコンなど)
-- local signs = { Error = " ", Warn = " ", Hint = "hint ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
vim.diagnostic.config({
  virtual_text = false, -- 行末のエラー表示は無効化 (任意)
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- LSP ウィンドウの見た目を調整 (任意)
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = "rounded" })

-- 各サーバーの設定を読み込んで setup
M.setup_servers = function()
  local servers = {
    lua_ls = require("config.lsp.servers.lua_ls"),
    efm = require("config.lsp.servers.efm"),
    -- 他の言語のサーバー設定を追加
    -- pyright = {}, -- 例: デフォルト設定で良い場合
    -- yamlls = require("config.lsp.servers.yamlls"),
  }

  local mason_lspconfig = require("mason-lspconfig")

  mason_lspconfig.setup_handlers({
    -- デフォルトのハンドラー: 各サーバーに共通設定を適用して lspconfig.<server>.setup() を呼び出す
    function(server_name)
      local server_opts = servers[server_name] or {} -- サーバー固有設定を取得、なければ空テーブル
      -- 共通設定と固有設定をマージ
      local opts = vim.tbl_deep_extend("force", {
        on_attach = on_attach,
        capabilities = capabilities,
      }, server_opts)

      -- 特殊な設定が必要なサーバーはここで条件分岐
      if server_name == "efm" then
        -- EFM の場合は filetypes も設定に含める必要がある
        opts.filetypes = require("config.lsp.servers.efm").filetypes -- EFM 設定から filetypes を取得
        -- init_options も設定
        opts.init_options = require("config.lsp.servers.efm").init_options
        opts.settings = require("config.lsp.servers.efm").settings
      end

      lspconfig[server_name].setup(opts)
    end,
    -- 特定のサーバーに対してカスタムハンドラーを設定することも可能
    -- ["lua_ls"] = function() ... end,
  })
end

-- モジュールの初期化時にサーバーをセットアップ
M.setup_servers()

return M
