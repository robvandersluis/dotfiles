local M = {}

M.is_mac = function()
	return vim.loop.os_uname().sysname == "Darwin"
end

M.is_windows = function()
	return vim.loop.os_uname().sysname == "Windows_NT"
end

return M
