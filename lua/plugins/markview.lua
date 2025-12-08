return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = { "saghen/blink.cmp" },
	config = function()
		vim.keymap.set("n", "<leader>M", "<cmd>Markview toggle<cr>", { desc = "Toggle Markview" })
	end,
}
