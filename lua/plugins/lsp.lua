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
			require("java.jdtls")
			vim.lsp.config("dartls", {})
			vim.lsp.enable("dartls")
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
			automatic_enable = {
				exclude = {
					"jdtls",
				},
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = function(client, bufnr)
							require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
						end,
					})
				end,
			})
		end,
	},
	{
		'stevearc/conform.nvim',
		opts = {
			formatters = {
				prettier = {
					command = vim.fn.expand("~/.local/share/nvim/mason/bin/prettier")
				},
			},
			formatters_by_ft = {
				-- lua = { "lua_ls" },

				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },

				java = { "google-java-format" },

			},
		},
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "artemave/workspace-diagnostics.nvim", opts = {} },
}
