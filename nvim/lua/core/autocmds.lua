local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text for visual feedback (like "copy flash" in other editors)
autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Lua: 2-spaces indent
autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- Markdown: spellcheck, wrap, en fatsoenlijke indent
autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true -- wrap op woordgrens
		vim.opt_local.spell = true -- spellcheck aan
		vim.opt_local.spelllang = "en,nl" -- Engels en Nederlands
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
	end,
})

-- C#
autocmd("FileType", {
	pattern = "cs",
	callback = function()
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
		vim.opt_local.softtabstop = 0
		vim.opt_local.expandtab = false
	end,
})
