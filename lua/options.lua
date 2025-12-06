vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.breakindent = true
vim.opt.signcolumn = "yes"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.opt.scrolloff = 150

vim.opt.updatetime = 250

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.confirm = true
vim.opt.inccommand = "split"

-- Maybe termguicolors?
-- vim.opt.termguicolors = true

