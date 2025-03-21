return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<C-\\>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
		{ "<C-1>", "<cmd>:2ToggleTerm direction=horizontal size=14<CR>", mode = { "n", "t" } },
		{ "<leader>gs", "<cmd>:lua _git_status_toggle()<CR>", mode = { "n", "t" }, desc = "Git status in terminal" },
		{ "<leader>gd", "<cmd>:lua _git_diff_toggle()<CR>", mode = { "n", "t" }, desc = "Git diff in terminal" },
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

		-- Git Status Terminal
		local git_status = Terminal:new({
			cmd = "git status && " .. shell,
			hidden = true,
			direction = "float",
			close_on_exit = true,
			start_in_insert = true,
		})

		function _git_status_toggle()
			git_status:toggle()
		end

		-- Git Diff Terminal
		local git_diff = Terminal:new({
			cmd = "git --no-pager diff && " .. shell,
			hidden = true,
			direction = "float",
			close_on_exit = true,
			start_in_insert = true,
		})

		function _git_diff_toggle()
			git_diff:toggle()
		end

		local live_server = Terminal:new({
			cmd = "live-server", -- Command om live-server te starten
			hidden = true,
			direction = "float", -- Opties: "horizontal", "vertical", "float", "tab"
			close_on_exit = false, -- Server blijft draaien na sluiten van terminal
			start_in_insert = true,
		})

		function _live_server_toggle()
			live_server:toggle()
		end

		vim.api.nvim_set_keymap(
			"n",
			"<leader>ls",
			"<cmd>lua _live_server_toggle()<CR>",
			{ noremap = true, silent = true }
		)

		local function get_git_branch()
			local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
			local result = handle:read("*a")
			handle:close()
			return result:gsub("\n", "") -- Verwijder newline
		end
		-- LazyGit
		vim.keymap.set({ "n", "t" }, "<leader>gl", function()
			local terminal = require("toggleterm.terminal").Terminal
			local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
			lazygit:toggle()
		end, { desc = "LazyGit" })
	end,
}
