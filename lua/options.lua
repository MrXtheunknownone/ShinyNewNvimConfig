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

vim.opt.scrolloff = 23
vim.opt.cursorline = true

vim.opt.updatetime = 250

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.confirm = true
vim.opt.inccommand = "split"

vim.opt.termguicolors = true

vim.diagnostic.config({
	virtual_lines = true,
})
