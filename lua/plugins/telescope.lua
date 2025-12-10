return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.2.0",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons", opts = {} },
		},
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fo", function()
				builtin.find_files({ hidden = true })
			end, { desc = "[F]ind [o]ld files" })

			vim.keymap.set("n", "<leader>fg", function()
				builtin.live_grep({ hidden = true })
			end, { desc = "Telescope live [G]rep" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		end,
	},
	{
		"jemag/telescope-diff.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			vim.keymap.set("n", "<leader>fdd", function()
				require("telescope").extensions.diff.diff_files({ hidden = true })
			end, { desc = "Compare 2 files" })
			vim.keymap.set("n", "<leader>fdc", function()
				require("telescope").extensions.diff.diff_current({ hidden = true })
			end, { desc = "Compare file with current" })
		end,
	},
}
