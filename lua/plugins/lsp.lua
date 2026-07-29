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
		-- init_options = {
		-- 	userLanguages = {
		-- 		rust = "html"
		-- 	}
		-- },
		config = function()
			require("java.jdtls")
			require("java.java_lsp_dev")
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
			vim.diagnostic.config({ update_in_insert = false });
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
			formatters_by_ft = {
				-- lua = { "lua-language-server" },

				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },

				java = { "google-java-format" },
				dart = { "ast-grep" },

				yaml = { "prettier" },
			  json = { "prettier" },
				xml = { "xmlformatter" }

			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
	},
	{ "mfussenegger/nvim-jdtls" },
	{ "artemave/workspace-diagnostics.nvim", opts = {} },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"jdtls",
				"java-debug-adapter",
				"prettier",
				"google-java-format",
				"ast-grep",
				"xmlformatter",
			},
		},
	},
}
