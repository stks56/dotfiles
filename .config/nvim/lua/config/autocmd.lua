local autocmd = vim.api.nvim_create_autocmd

-- autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params()
-- 		params.context = { only = { "source.organizeImports" } }
-- 		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
-- 		-- machine and codebase, you may want longer. Add an additional
-- 		-- argument after params if you find that you have to write the file
-- 		-- twice for changes to be saved.
-- 		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
-- 		for cid, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
-- 					vim.lsp.util.apply_workspace_edit(r.edit, enc)
-- 				end
-- 			end
-- 		end
-- 		vim.lsp.buf.format({ async = false })
-- 	end,
-- })
--
--

---@param mods string filename-modifiers
---@param buf_path string|nil file path (defaults to current buffer)
---@return string
---see: https://vim-jp.org/vimdoc-ja/cmdline.html#filename-modifiers
local function format_path(mods, buf_path)
	local path = buf_path or require("oil").get_current_dir() or vim.fn.expand("%")
	return vim.fn.fnamemodify(path, mods)
end

---@param path string
local function copy_to_clipboard(path)
	vim.fn.setreg("+", path)
	vim.api.nvim_echo({ { "Copied: " .. path } }, false, {})
end

vim.api.nvim_create_user_command("CopyRelativeFilePath", function()
	copy_to_clipboard(format_path(":."))
end, { nargs = 0, force = true, desc = "Copy relative file path to the clipboard" })

vim.api.nvim_create_user_command("CopyAbsoluteFilePath", function()
	copy_to_clipboard(format_path(":p"))
end, { nargs = 0, force = true, desc = "Copy absolute file path to the clipboard" })

vim.api.nvim_create_user_command("CopyFileName", function()
	copy_to_clipboard(format_path(":t"))
end, { nargs = 0, force = true, desc = "Copy just the file name to the clipboard" })

vim.api.nvim_create_user_command("CopyRelativeDirectoryPath", function()
	copy_to_clipboard(format_path(":p:h"))
end, { nargs = 0, force = true, desc = "Copy relative directory name to the clipboard" })

vim.api.nvim_create_user_command("CopyRelativeFilePathWithLine", function()
	copy_to_clipboard(format_path(":.") .. ":" .. vim.fn.line("."))
end, { nargs = 0, force = true, desc = "Copy relative file path with line to the clipboard" })

vim.api.nvim_create_user_command("CopyRelativeFilePathWithLineAndCol", function()
	copy_to_clipboard(format_path(":.") .. ":" .. vim.fn.line(".") .. ":" .. vim.fn.col("."))
end, { nargs = 0, force = true, desc = "Copy relative file path with line and col to the clipboard" })
