return {
	{
		dir = "~/plugins/gitcommit-ai.nvim",
		--		"robvandersluis/gitcommit-ai.nvim",
		config = function()
			require("gitcommit").setup({
				stage_all = false,
			})
			-- Default keymap
			vim.keymap.set("n", "<leader>gc", "<cmd>GenerateCommitMessage<CR>", { desc = "AI Commit", silent = true })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
