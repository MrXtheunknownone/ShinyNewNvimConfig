-- Windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
vim.keymap.set("n", "<C-left>", "5<C-w><", { desc = "Window width +" })
vim.keymap.set("n", "<C-right>", "5<C-w>>", { desc = "Window width -" })

-- Escape
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Tabs
vim.keymap.set("n", "<M-t>", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<M-T>", function()
	require("easyTabs").run()
end)
vim.keymap.set("n", "<M-q>", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>-tabnext<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>+tabnext<CR>")

vim.keymap.set("n", "<M-left>", "<cmd>-tabmove<cr>", { desc = "Move Tab to left" })
vim.keymap.set("n", "<M-right>", "<cmd>+tabmove<cr>", { desc = "Move Tab to right" })

-- Navigation
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- LSP
vim.keymap.set("n", "gd", function()
	require("telescope.builtin").lsp_definitions()
end, { desc = "[G]oto [D]efinition" })

vim.keymap.set("n", "gi", function()
	require("telescope.builtin").lsp_implementations()
end, { desc = "[G]oto [I]mplementation" })

vim.keymap.set("n", "gt", function()
	require("telescope.builtin").lsp_type_definitions()
end, { desc = "[G]oto [T]ype Definition" })

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>u", function()
	require("telescope.builtin").lsp_references()
end, { desc = "[G]oto [U]sages" })

vim.keymap.set("n", "<leader>q", vim.lsp.buf.hover, { desc = "[Q]uick Hover" })
vim.keymap.set("n", "<leader>p", vim.lsp.buf.signature_help, { desc = "Signature Hel[P]" })

vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float, { desc = "Show Hover [E]rrors" })

vim.keymap.set("n", "<leader>d", function()
require("toggle_diagnostics").toggle_inline_diagnostics()
end, { desc = "Toggle inline diagnostic" })

vim.keymap.set("n", "<leader>e", function()
	require("telescope.builtin").diagnostics()
end, { desc = "Show [E]rrors" })
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Code [A]ction" })
vim.keymap.set("n", "<leader>m", vim.lsp.buf.format, { desc = "[F]ormat Buffer" })

-- Utilities
vim.keymap.set("n", "Y", "y$")
vim.keymap.set("v", "/", "y/<C-r>*")
vim.keymap.set("v", "?", "y?<C-r>*")

vim.keymap.set("n", "<leader>t", "<cmd>vsp | term<cr>50<C-w><i", { desc = "New [T]erminal" })
vim.keymap.set("n", "<leader>b", "<cmd>BlameToggle<cr>", { desc = "Toggle Git Blame" })
-- vim.keymap.set("n", "<leader>j", "<cmd>tabnext | term<cr>ijiratui ui<cr>", { desc = "Open Jira TUI" })
vim.keymap.set("n", "<leader>X", "<cmd>.lua<cr>", { desc = "Run lua line" })
vim.keymap.set("n", "<leader>x", "<cmd>source %<cr>", { desc = "Run lua file" })
