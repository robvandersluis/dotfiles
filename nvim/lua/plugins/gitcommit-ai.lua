return {
	{
		"robvandersluis/gitcommit-ai.nvim",
		config = function()
			require("gitcommit").setup({
				stage_all = false, -- manually stage changes
				auto_fetch = true, -- Fetch before pushing (if tracking branch exists)
				prompt_after_commit = true, -- Prompt to push after committing
			})
			vim.keymap.set("n", "<leader>gc", "<cmd>GenerateCommitMessage<CR>", { desc = "AI Commit", silent = true })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
