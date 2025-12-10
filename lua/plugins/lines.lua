return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		tabline = {
			lualine_a = { "string.match(vim.uv.cwd(), '([^/]+)$')" },
			lualine_b = { "tabs" },
		},
	},
}
