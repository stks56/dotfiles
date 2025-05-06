local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- 保存時にフォーマットを実行する Autocmd グループ
local format_on_save_group = augroup("FormatOnSave", { clear = true })

autocmd("BufWritePre", {
	group = format_on_save_group,
	pattern = "*", -- 全てのファイルタイプで試行 (EFMが対応言語か判断)
	-- pattern = {"*.lua", "*.py", "*.sh"}, -- 対象を絞る場合
	callback = function(args)
		-- EFM がバッファにアタッチされているか確認
		local efm_clients = vim.lsp.get_active_clients({ name = "efm", bufnr = args.buf })
		if #efm_clients > 0 then
			-- フォーマット機能が有効か確認 (init_options.documentFormatting = true)
			if efm_clients[1] and efm_clients[1].supports_method("textDocument/formatting") then
				print("Formatting using EFM...")
				-- 同期的にフォーマットを実行 (保存前に完了させるため)
				-- タイムアウトを設定しないと大きなファイルで固まる可能性あり
				vim.lsp.buf.format({ bufnr = args.buf, async = false, timeout_ms = 5000 })
			end
			-- else
			-- print("EFM not active for this buffer, skipping format on save.")
		end

		-- 代替案: conform.nvim を使う場合
		-- pcall(function() require("conform").format({ bufnr = args.buf, lsp_fallback = true, async = false, timeout_ms = 1000 }) end)
	end,
	desc = "Format file before saving if EFM is available",
})

-- 他の自動コマンド...
-- 例: カーソル位置の復元
local remember_cursor_group = augroup("RememberCursorPos", { clear = true })
autocmd("BufReadPost", {
	group = remember_cursor_group,
	pattern = "*",
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
