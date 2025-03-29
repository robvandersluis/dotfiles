-- Install prettier via:
--   npm install -g prettier
return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			json = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			yaml = { "prettier" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
