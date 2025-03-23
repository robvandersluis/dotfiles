return {
	{
		dir = "~/plugins/gitcommit-ai.nvim",
		config = function()
			require("gitcommit").setup({
				model = "gpt-4o-mini",
				--		api_key = os.getenv("OPENAI_API_KEY"),
			})
			-- Default keymap
			vim.keymap.set("n", "<leader>gc", "<cmd>GenerateCommitMessage<CR>", { desc = "AI Commit", silent = true })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
