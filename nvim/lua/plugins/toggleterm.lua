return {
	"akinsho/toggleterm.nvim",
	keys = {
		{ "<C-\\>", "<cmd>:1ToggleTerm direction=float<CR>", mode = { "n", "i", "t" } },
		{ "<M-F1>", "<cmd>:2ToggleTerm direction=horizontal size=20<CR>", mode = { "n", "t" } },
		{ "<M-F2>", "<cmd>:3ToggleTerm direction=vertical size=100<CR>", mode = { "n", "t" } },
		{ "<M-F3>", "<cmd>:4ToggleTerm direction=float<CR>", mode = { "n", "t" } },
		{ "<leader>gs", "<cmd>:lua _git_status_toggle()<CR>", mode = { "n", "t" }, desc = "Git status in terminal" },
		{ "<leader>gd", "<cmd>:lua _git_diff_toggle()<CR>", mode = { "n", "t" }, desc = "Git diff in terminal" },
		{ "<leader>gl", "<cmd>:lua _git_log_toggle()<CR>", mode = { "n", "t" }, desc = "Git log in terminal" },
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
			cmd = "git status; exec $SHELL",
			hidden = true,
			direction = "float",
			close_on_exit = false,
		})

		function _git_status_toggle()
			git_status:toggle()
		end

		-- Git Diff Terminal
		local git_diff = Terminal:new({
			cmd = "git diff; exec $SHELL",
			hidden = true,
			direction = "float",
			close_on_exit = false,
		})

		function _git_diff_toggle()
			git_diff:toggle()
		end

		-- Git Log Terminal
		local git_log = Terminal:new({
			cmd = "git log --oneline --graph --all; exec $SHELL",
			hidden = true,
			direction = "float",
			close_on_exit = false,
		})

		function _git_log_toggle()
			git_log:toggle()
		end
	end,
}
