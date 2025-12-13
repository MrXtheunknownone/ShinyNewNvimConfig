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
			ensure_installed = { "rust_analyzer" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			-- require("mason-lspconfig").setup({
			-- 	function(server_name)
			-- 		require("lspconfig")[server_name].setup({
			-- 			on_attach = function(client, bufnr)
			-- 				require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
			-- 			end,
			-- 		})
			-- 	end,
			-- })
		end,
	},
	{
		"nvim-java/nvim-java",
		config = function()
			require("java").setup()
			vim.lsp.enable("jdtls")
		end,
	},
	-- { "artemave/workspace-diagnostics.nvim", opts = {} },
}
