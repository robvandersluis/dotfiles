return {
	"github/copilot.vim",
	config = function()
		-- Accepteer suggestie met Ctrl+J
		vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true

		-- Functies om Copilot in/uit te schakelen globaal
		local function copilot_enable()
			vim.cmd("Copilot enable")
			print("✅ Copilot ingeschakeld")
		end

		local function copilot_disable()
			vim.cmd("Copilot disable")
			print("❌ Copilot uitgeschakeld")
		end

		local function copilot_toggle()
			local status = vim.fn["copilot#Enabled"]()
			if status == 1 then
				copilot_disable()
			else
				copilot_enable()
			end
		end

		-- Functie om Copilot per buffer uit te schakelen
		local function copilot_toggle_buffer()
			local buf_status = vim.b.copilot_enabled
			if buf_status == nil or buf_status == 1 then
				vim.b.copilot_enabled = 0
				vim.cmd("Copilot disable")
				print("❌ Copilot uitgeschakeld voor deze buffer")
			else
				vim.b.copilot_enabled = 1
				vim.cmd("Copilot enable")
				print("✅ Copilot ingeschakeld voor deze buffer")
			end
		end

		-- Mappings voor togglen
		vim.keymap.set("n", "<leader>ce", copilot_enable, { desc = "Copilot inschakelen" })
		vim.keymap.set("n", "<leader>cd", copilot_disable, { desc = "Copilot uitschakelen" })
		vim.keymap.set("n", "<leader>ct", copilot_toggle, { desc = "Copilot togglen" })
		vim.keymap.set("n", "<leader>cb", copilot_toggle_buffer, { desc = "Copilot per buffer togglen" })
	end,
}
