--  Exits insert mode with jj
vim.keymap.set("i", "jj", "<ESC>")

-- End of line motions (similar to $)
vim.keymap.set({ "n", "o", "x" }, ";", "$", { desc = "End" })
vim.keymap.set("n", "d;", "d$", { desc = "Delete" })
vim.keymap.set("n", "y;", "y$", { desc = "Yank" })
vim.keymap.set("n", "c;", "c$", { desc = "Change" })

-- Select all
vim.keymap.set("n", "<leader>a", "gg0VG", { desc = "Select all from column 0" })

-- Ctrl + s to save
vim.keymap.set("n", "<C-S>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-S>", "<ESC>:w<CR>", { noremap = true, silent = true })

-- undo and paste in insert mode with <C-z> and <C-v>
vim.keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
vim.keymap.set("i", "<C-z>", "<Esc>u", { noremap = true, silent = true })

-- Paste over selection without overwriting default register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Move selected block up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move current line up/down
vim.keymap.set("n", "K", ":m .-2<CR>==")
vim.keymap.set("n", "J", ":m .+1<CR>==")

-- Macro recording
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("n", "<leader>m", "q")

-- Close Current Buffer
vim.keymap.set("n", "<leader>q", ":bd<CR>")

-- Exit all no save
vim.keymap.set("n", "ZQ", "<Nop>")
vim.keymap.set("n", "<leader>x", ":qa!<CR>")
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><C-w>w", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
--vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
--vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
--vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
--vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--
---- File Explorer
vim.keymap.set("n", "<leader>pv", ":Ex<CR>", { desc = "Explore current file directory" })
vim.keymap.set("n", "<leader>ph", function()
	vim.cmd("Ex " .. vim.fn.expand("~"))
end, { desc = "Explore home directory" })
