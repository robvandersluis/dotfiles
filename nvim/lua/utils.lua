local M = {}

M.is_mac = function()
	return vim.loop.os_uname().sysname == "Darwin"
end

M.is_windows = function()
	return vim.loop.os_uname().sysname == "Windows_NT"
end

M.is_linux = function()
	return vim.loop.os_uname().sysname == "Linux"
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

return M
