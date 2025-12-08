return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("dartls", {})
			vim.lsp.enable("dartls")
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- Currently a bug in lua's electrical system
			ensure_installed = { "lua_ls@3.15.0", "rust_analyzer" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup()
			vim.lsp.enable("jdtls")
		end,
	},
}
