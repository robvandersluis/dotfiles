return {
	{
		dir = "~/plugins/gitcommit-ai.nvim",
		config = function()
			require("gitcommit").setup({
				model = "gpt-4o-mini",
				--		api_key = os.getenv("OPENAI_API_KEY"),
			})
		end,
	},
}
