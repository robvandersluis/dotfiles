return {
	"github/copilot.vim",
	config = function()
		-- Accept suggestion with Ctrl+J
		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true

		local function copilot_enable()
			vim.cmd("Copilot enable")
			print("✅ Copilot enabled")
		end

		local function copilot_disable()
			vim.cmd("Copilot disable")
			print("❌ Copilot disabled")
		end

		local function copilot_toggle()
			local status = vim.fn["copilot#Enabled"]()
			if status == 1 then
				copilot_disable()
			else
				copilot_enable()
			end
		end

		local function copilot_toggle_buffer()
			local buf_status = vim.b.copilot_enabled
			if buf_status == nil or buf_status == 1 then
				vim.b.copilot_enabled = 0
				vim.cmd("Copilot disable")
				print("❌ Copilot disabled for this buffer")
			else
				vim.b.copilot_enabled = 1
				vim.cmd("Copilot enable")
				print("✅ Copilot enabled for this buffer")
			end
		end

		-- Disable Copilot for Markdown files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.b.copilot_enabled = false
			end,
		})
		-- Mappings
		vim.keymap.set("n", "<leader>ce", copilot_enable, { desc = "Enable Copilot" })
		vim.keymap.set("n", "<leader>cd", copilot_disable, { desc = "Disable Copilot" })
		vim.keymap.set("n", "<leader>ct", copilot_toggle, { desc = "Toggle Copilot" })
		vim.keymap.set("n", "<leader>cb", copilot_toggle_buffer, { desc = "Toggle Copilot per buffer" })
	end,
}
