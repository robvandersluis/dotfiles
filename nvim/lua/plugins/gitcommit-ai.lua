return {
	{
		dir = "~/plugins/gitcommit-ai.nvim",
		--	"robvandersluis/gitcommit-ai.nvim",
		config = function()
			require("gitcommit").setup({
				model = "gpt-4o-mini",
				system_prompt = [[
Je bent een assistent die alleen git commit messages genereert.
Gebruik een van de volgende prefixen:
- Feature: voor nieuwe functionaliteit
- Bugfix: voor opgeloste bugs
- Refactor: voor codewijzigingen zonder functionele impact
Geef alleen de commit message terug, zonder uitleg.
]],
				--		api_key = os.getenv("OPENAI_API_KEY"),
			})
			-- Default keymap
			vim.keymap.set("n", "<leader>gc", "<cmd>GenerateCommitMessage<CR>", { desc = "AI Commit", silent = true })
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
