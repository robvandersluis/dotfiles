return {
	{
		dir = "~/plugins/gitcommit-ai.nvim",
		--		"robvandersluis/gitcommit-ai.nvim",
		config = function()
			require("gitcommit").setup({
				model = "o4-mini",
				temperature = 1,
				stage_all = false, -- manually stage changes
				auto_fetch = false, -- Fetch before pushing (if tracking branch exists)
				prompt_after_commit = false, -- Prompt to push after committing
			})
			vim.keymap.set("n", "<leader>gc", "<cmd>GenerateCommitMessage<CR>", { desc = "AI Commit", silent = true })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
