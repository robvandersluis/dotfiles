local utils = require("utils")
return {
	"akinsho/toggleterm.nvim",
	keys = (function()
		local keys = {
			{ "<C-\\>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
			{
				"<leader>gS",
				"<cmd>:lua _terminal_toggle('git status')<CR>",
				mode = { "n", "t" },
				desc = "Git status",
			},
			{
				"<leader>DB",
				"<cmd>:lua _terminal_toggle('dotnet build')<CR>",
				mode = { "n", "t" },
				desc = "dotnet build",
			},
			{
				"<leader>gL",
				"<cmd>lua _terminal_toggle('git --no-pager log --oneline --since=\"3 days ago\"')<CR>",
				mode = { "n", "t" },
				desc = "Git log last 3 days",
			},
			{
				"<leader>gD",
				"<cmd>:lua _terminal_toggle('git --no-pager diff')<CR>",
				mode = { "n", "t" },
				desc = "Git diff",
			},
		}

		if utils.is_mac() then
			table.insert(keys, { "<C-1>", "<cmd>:1ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "t" } })
			table.insert(keys, { "<C-2>", "<cmd>:2ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "t" } })
		else
			table.insert(keys, { "<C-F1>", "<cmd>:1ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "t" } })
			table.insert(keys, { "<C-F2>", "<cmd>:2ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "t" } })
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

		local Terminal = require("toggleterm.terminal").Terminal
		local terminals = {}

		function _terminal_toggle(cmd)
			if terminals[cmd] == nil then
				terminals[cmd] = Terminal:new({
					cmd = cmd .. " && " .. utils.shell(),
					hidden = true,
					direction = "float",
					close_on_exit = true,
					start_in_insert = true,
				})
				terminals[cmd]:open()
			else
				terminals[cmd]:toggle()
			end
		end
	end,
}
