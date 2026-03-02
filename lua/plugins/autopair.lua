return {
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{ "windwp/nvim-ts-autotag",          opts = {} },
	{ "hiphish/rainbow-delimiters.nvim" },
	{
		"kana/vim-textobj-entire",
		dependencies = { "kana/vim-textobj-user" },
	},
	{ 'nvim-mini/mini.surround', version = false, opts = {} },
}
