local utils = require("utils")

local terminals = {}

local function map(lhs, cmd, desc)
	return { lhs, string.format("<cmd>lua _terminal_toggle('%s')<CR>", cmd), mode = { "n", "t" }, desc = desc }
end

local function normalize_cmd(cmd)
	return cmd:gsub("%s+", " "):gsub("^%s*(.-)%s*$", "%1")
end

function _terminal_toggle(cmd)
	local Terminal = require("toggleterm.terminal").Terminal
	local dir = vim.fn.expand("%:p:h") -- current buffer dir
	cmd = normalize_cmd(cmd)
	if terminals[cmd] == nil then
		terminals[cmd] = Terminal:new({
			cmd = cmd .. " && " .. utils.shell(),
			hidden = true,
			direction = "float",
			close_on_exit = true,
			start_in_insert = true,
			dir = dir,
		})
	end
	-- update dir on reuse
	terminals[cmd].dir = dir
	terminals[cmd]:toggle()
end

return {
	"akinsho/toggleterm.nvim",
	keys = (function()
		local keys = {
			{ "<C-\\>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
			map("<leader>gS", "git status", "Git status"),
			map("<leader>gD", "git --no-pager diff", "Git diff"),
			map("<leader>gL", 'git --no-pager log --oneline --since="3 days ago"', "Git log last 3 days"),
			map("<leader>DB", "dotnet build", "Dotnet build"),

			map("<leader>ls", utils.is_windows() and "live-server.cmd" or "live-server", "Start live-server"),
		}
		if utils.is_mac() then
			table.insert(
				keys,
				{ "<C-1>", "<cmd>:1ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "i", "t" } }
			)
			table.insert(
				keys,
				{ "<C-2>", "<cmd>:2ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "i", "t" } }
			)
		else
			table.insert(
				keys,
				{ "<C-F1>", "<cmd>:1ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "i", "t" } }
			)
			table.insert(
				keys,
				{ "<C-F2>", "<cmd>:2ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "i", "t" } }
			)
		end

		return keys
	end)(),
	version = "*",
	config = function()
		require("toggleterm").setup({
			start_in_insert = true,
			terminal_mappings = true,
			shell = utils.shell(),
			auto_scroll = true,
			persist_size = true,
			close_on_exit = true,
		})
	end,
}
