return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<C-\\>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
		{ "<M-F1>", "<cmd>:2ToggleTerm direction=horizontal size=12<CR>", mode = { "n", "t" } },
		{
			"<leader>gS",
			"<cmd>:lua _terminal_toggle('git status')<CR>",
			mode = { "n", "t" },
			desc = "Git status in terminal",
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
		local os_name = vim.loop.os_uname().sysname
		local shell = "/bin/bash" -- Default voor Unix

		if os_name == "Windows_NT" then
			shell = "pwsh.exe -NoLogo"
		elseif os_name == "Darwin" then
			shell = "/bin/zsh" -- Standaard shell op macOS
		end

		require("toggleterm").setup({
			start_in_insert = true,
			terminal_mappings = true,
			shell = shell,
			auto_scroll = true,
			persist_size = true,
			close_on_exit = true,
		})

		local Terminal = require("toggleterm.terminal").Terminal

		-- Cache van dynamisch aangemaakte terminals per commando
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
			end
			terminals[cmd]:toggle()
		end

		-- local function get_git_branch()
		-- 	local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
		-- 	local result = handle:read("*a")
		-- 	handle:close()
		-- 	return result:gsub("\n", "") -- Verwijder newline
		-- end

		-- LazyGit
		vim.keymap.set({ "n", "t" }, "<leader>gl", function()
			local terminal = require("toggleterm.terminal").Terminal
			local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
			lazygit:toggle()
		end, { desc = "LazyGit" })
	end,
}
