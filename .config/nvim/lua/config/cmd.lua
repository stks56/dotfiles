vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"c",
		"c_sharp",
		"elixir",
		"go",
		"gomod",
		"heex",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"nix",
		"query",
		"typescript",
		"vim",
		"vimdoc",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

local function format_path(mods, buf_path)
	local path = buf_path or require("oil").get_current_dir() or vim.fn.expand("%")
	return vim.fn.fnamemodify(path, mods)
end

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

vim.api.nvim_create_user_command("Open", function()
	local path = vim.api.nvim_buf_get_name(0)
	if path == "" then
		vim.notify("Current buffer has no file path", vim.log.levels.ERROR)
		return
	end

	vim.system({ "open", path }, { text = true }, function(result)
		if result.code ~= 0 then
			vim.schedule(function()
				local message = vim.trim(result.stderr or "")
				vim.notify(message ~= "" and message or "Failed to open current buffer", vim.log.levels.ERROR)
			end)
		end
	end)
end, { nargs = 0, force = true, desc = "Open the current buffer with the default application" })

local function notify_error(message)
	vim.schedule(function()
		vim.notify(message, vim.log.levels.ERROR)
	end)
end

local function open_pull_request_picker(prs)
	Snacks.picker.gh_pr({
		finder = function()
			return prs
		end,
		live = false,
		supports_live = false,
	})
end

local function list_pull_requests(branch)
	Snacks.gh.api.list("pr", function(prs)
		if not prs or #prs == 0 then
			notify_error("No pull request found for branch: " .. branch)
			return
		end

		vim.schedule(function()
			open_pull_request_picker(prs)
		end)
	end, {
		state = "all",
		search = "head:" .. branch,
	})
end

vim.api.nvim_create_user_command("OpenPullRequest", function()
	vim.system({ "git", "branch", "--show-current" }, { text = true }, function(result)
		if result.code ~= 0 then
			local message = vim.trim(result.stderr or "")
			notify_error(message ~= "" and message or "Failed to get current branch")
			return
		end

		local branch = vim.trim(result.stdout or "")
		if branch == "" then
			notify_error("Not on a branch")
			return
		end

		vim.schedule(function()
			list_pull_requests(branch)
		end)
	end)
end, { nargs = 0, force = true, desc = "Open the pull requests of the current branch with snacks.gh" })
