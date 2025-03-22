local M = {}

M.is_mac = function()
	return vim.loop.os_uname().sysname == "Darwin"
end

M.is_windows = function()
	return vim.loop.os_uname().sysname == "Windows_NT"
end

M.shell = function()
	if M.is_windows() then
		return "pwsh.exe -NoLogo"
	elseif M.is_mac() then
		return "/bin/zsh"
	else
		return "/bin/bash"
	end
end
-- local function get_git_branch()
-- 	local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
-- 	local result = handle:read("*a")
-- 	handle:close()
-- 	return result:gsub("\n", "") -- Verwijder newline
-- end

return M
