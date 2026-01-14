-- カスタムコマンド定義

-- 置換コマンド
vim.api.nvim_create_user_command("Sed", function(opt)
	local args = opt.args
	local words = vim.split(args, " ")
	if #words >= 2 then
		local old = words[1]
		local new = words[2]
		vim.cmd(string.format("%%s/%s/%s/g", old, new))
	end
end, {
	nargs = "*",
	complete = "file",
})

-- パス取得用ヘルパー関数
local function get_range_str(opts)
	if opts.range ~= 2 then
		return ""
	end
	if opts.line1 == opts.line2 then
		return "#L" .. opts.line1
	end
	return "#L" .. opts.line1 .. "-L" .. opts.line2
end

local function copy_path(opts, target)
	local expr = "%"
	if target == "full path" then
		expr = "%:p"
	elseif target == "file name" then
		expr = "%:t"
	elseif target == "relative path" then
		local current_file = vim.fn.expand("%:p")

		-- Remove any URI scheme (e.g., oil://, neo-tree://, etc.)
		if current_file:match("^%w+://") then
			current_file = current_file:gsub("^%w+://", "")
		end

		local nvim_start_dir = vim.fn.getcwd()
		local relative_path =
			vim.fn.fnamemodify(current_file, ":s?" .. vim.fn.escape(nvim_start_dir, "\\") .. "/??")
		local path = relative_path .. get_range_str(opts)
		vim.fn.setreg("*", path)
		vim.notify("Copied " .. target .. ": " .. path)
		return
	end

	local path = vim.fn.expand(expr)

	-- Remove any URI scheme (e.g., oil://, neo-tree://, etc.)
	if path:match("^%w+://") then
		path = path:gsub("^%w+://", "")
	end

	path = path .. get_range_str(opts)
	vim.fn.setreg("*", path)
	vim.notify("Copied " .. target .. ": " .. path)
end

-- パスコピーコマンド
vim.api.nvim_create_user_command("Cfp", function(opts)
	copy_path(opts, "full path")
end, { range = true, desc = "Copy the full path of the current file to the clipboard" })

vim.api.nvim_create_user_command("Crp", function(opts)
	copy_path(opts, "relative path")
end, { range = true, desc = "Copy the relative path of the current file to the clipboard" })

vim.api.nvim_create_user_command("Cfn", function(opts)
	copy_path(opts, "file name")
end, { range = true, desc = "Copy the file name of the current file to the clipboard" })

-- LSP制御コマンド
vim.api.nvim_create_user_command("Nonts", function()
	vim.lsp.stop_client(vim.lsp.get_clients({ name = "ts_ls" }))
end, { desc = "Stop TypeScript LSP server" })

vim.api.nvim_create_user_command("Nondeno", function()
	vim.lsp.stop_client(vim.lsp.get_clients({ name = "denols" }))
end, { desc = "Stop Deno LSP server" })

-- Copilot制御コマンド
vim.api.nvim_create_user_command("Ghcd", function()
	vim.cmd("Copilot disable")
	vim.notify("Copilot disabled")
end, { desc = "Disable GitHub Copilot" })

vim.api.nvim_create_user_command("Ghcn", function()
	vim.cmd("Copilot enable")
	vim.notify("Copilot enabled")
end, { desc = "Enable GitHub Copilot" })

vim.api.nvim_create_user_command("CopilotToggle", function()
	local copilot_status = vim.fn["copilot#Enabled"]()
	if copilot_status == 1 then
		vim.cmd("Copilot disable")
		vim.notify("Copilot disabled")
	else
		vim.cmd("Copilot enable")
		vim.notify("Copilot enabled")
	end
end, { desc = "Toggle GitHub Copilot" })

-- フォーマットコマンド
vim.api.nvim_create_user_command("Fmt", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true, desc = "Format code" })

-- NotePush: git add, commit, push を一括実行
vim.api.nvim_create_user_command("NotePush", function()
	local Snacks = require("snacks")
	local buf_dir = vim.fn.expand("%:p:h")
	local git_root = vim.fn.systemlist("git -C " .. vim.fn.shellescape(buf_dir) .. " rev-parse --show-toplevel")[1]

	if vim.v.shell_error ~= 0 or not git_root then
		vim.notify("Not a git repository", vim.log.levels.ERROR)
		return
	end

	Snacks.input({ prompt = "Type 'yes' to push: " }, function(value)
		if value == "yes" then
			local cmd = string.format(
				"cd %s && git add . && git commit -m 'note update' && git push",
				vim.fn.shellescape(git_root)
			)
			vim.fn.jobstart(cmd, {
				on_exit = function(_, code)
					if code == 0 then
						vim.notify("Push complete: " .. git_root, vim.log.levels.INFO)
					else
						vim.notify("Push failed (code: " .. code .. ")", vim.log.levels.ERROR)
					end
				end,
			})
		else
			vim.notify("Cancelled", vim.log.levels.WARN)
		end
	end)
end, { desc = "git add, commit, push を一括実行" })
