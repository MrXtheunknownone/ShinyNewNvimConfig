return {
	{
		"sainnhe/everforest",
		config = function()
			vim.g.everforest_enable_italic = true
			vim.g.everforest_background = "hard"
			vim.cmd.colorscheme("everforest")
		end,
	},
	{
		'everviolet/nvim',
		name = 'evergarden',
		opts = {
			theme = {
				variant = 'fall',
				accent = 'green',
			},
			editor = {
				transparent_background = false,
				sign = { color = 'none' },
				float = {
					color = 'mantle',
					solid_border = false,
				},
				completion = {
					color = 'surface0',
				},
			},
		}
	},
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({})
			-- require("bamboo").load()
		end,
	},
	{
		"daschw/leaf.nvim",
		opts = {
			theme = "dark",
			contrast = "medium",
		}
	}
}
