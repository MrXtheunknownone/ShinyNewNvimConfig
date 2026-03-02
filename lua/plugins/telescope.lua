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

			vim.keymap.set("n", "<leader>ft", function()
				builtin.lsp_document_symbols({ hidden = true })
			end, { desc = "Telescope doc symbols and [T]ypes" })

			vim.keymap.set("n", "<leader>f/", function()
				builtin.current_buffer_fuzzy_find()
			end, { desc = "Telescope grep current buffer" })

			vim.keymap.set("n", "<leader>fm", function()
				builtin.marks()
			end, { desc = "Telescope marks" })

			vim.keymap.set("n", "<leader>fr", function()
				builtin.marks()
			end, { desc = "Telescope [F]ind [R]egisters" })

			vim.keymap.set("n", "<leader>gs", function()
				builtin.git_status()
			end, { desc = "[G]it [S]tatus telescope" })

			vim.keymap.set("n", "<leader>gc", function()
				builtin.git_bcommits()
			end, { desc = "[G]it [C]ommits of branch via telescope" })

			vim.keymap.set("n", "<leader>gC", function()
				builtin.git_commits()
			end, { desc = "All [G]it [C]ommits via telescope" })

			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			local telescope = require('telescope')
			local actions = require('telescope.actions')

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-g>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-g>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-p>"] = actions.move_selection_next,
							["<C-n>"] = actions.move_selection_previous,
						}
					}
				}
			})
		end,
		-- -- opts = {
		-- -- 		defaults = {
		-- -- 			mappings = {
		-- -- 				t = {
		-- -- 					["<C-<"] = require "telescope.actions".send_to_qflist + require "telescope.actions".open_qflist,
		-- -- 					["<M-<"] = require "telescope.actions".send_selected_to_qflist + require "telescope.actions".open_qflist,
		-- -- 				}
		-- -- 			}
		-- 		}
		-- }
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
