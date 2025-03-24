return {
	{
		dir = "~/plugins/gitcommit-ai.nvim",
		--		"robvandersluis/gitcommit-ai.nvim",
		config = function()
			require("gitcommit").setup({
				-- default settings
				model = "gpt-4o-mini",
				system_prompt = [[
You are an assistant that only generates git commit messages.
Use one of the following prefixes:
- Feature: for new functionality
- Bugfix: for resolved bugs
- Refactor: for code changes without functional impact
Return only the commit message, without any explanation.
]],
				user_prompt = "Generate a clear commit message based on this git diff:",

				api_key = os.getenv("OPENAI_API_KEY"),
			})
			-- Default keymap
			vim.keymap.set("n", "<leader>gc", "<cmd>GenerateCommitMessage<CR>", { desc = "AI Commit", silent = true })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
