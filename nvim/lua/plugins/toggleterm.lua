return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<C-\\>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
		{ "<C-1>", "<cmd>:1ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "t" } },
		{ "<C-2>", "<cmd>:2ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "t" } },
		{
			"<leader>gS",
			"<cmd>:lua _terminal_toggle('git status')<CR>",
			mode = { "n", "t" },
			desc = "Git status in terminal",
		},
		{
			"<leader>DD",
			"<cmd>:lua _terminal_toggle('dotnet build')<CR>",
			mode = { "n", "t" },
			desc = "dotnet build in terminal",
		},
		{
			"<leader>gD",
			"<cmd>:lua _terminal_toggle('git --no-pager diff')<CR>",
			mode = { "n", "t" },
			desc = "Git diff in terminal",
		},
	},
	version = "*",
	config = function()
		local shell = require("utils").shell()
		require("toggleterm").setup({
			start_in_insert = true,
			terminal_mappings = true,
			shell = shell,
			auto_scroll = true,
			persist_size = true,
			close_on_exit = true,
		})

		local Terminal = require("toggleterm.terminal").Terminal
		local terminals = {}

		function _terminal_toggle(cmd)
			if terminals[cmd] == nil then
				terminals[cmd] = Terminal:new({
					cmd = cmd .. " && " .. shell,
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
