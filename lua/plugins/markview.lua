return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = { "saghen/blink.cmp" },
	config = function()
		vim.keymap.set("n", "<leader>M", "<cmd>Markview toggle<cr>", { desc = "Toggle Markview" })
	end,
	opts = {
		preview = {
			icon_provider = "devicons"
		},
		markdown = {
			enable = true,
			block_quotes = {
				enable = true,
				wrap = true,

				default = {
					border = "▋",
					hl = "MarkviewBlockQuoteDefault"
				},

				["ABSTRACT"] = {
					preview = "󱉫 Abstract",
					hl = "MarkviewBlockQuoteNote",

					title = true,
					icon = "󱉫",
				},
				["SUMMARY"] = {
					hl = "MarkviewBlockQuoteNote",
					preview = "󱉫 Summary",

					title = true,
					icon = "󱉫",
				},
				["TLDR"] = {
					hl = "MarkviewBlockQuoteNote",
					preview = "󱉫 Tldr",

					title = true,
					icon = "󱉫",
				},
				["TODO"] = {
					hl = "MarkviewBlockQuoteNote",
					preview = " Todo",

					title = true,
					icon = "",
				},
				["INFO"] = {
					hl = "MarkviewBlockQuoteNote",
					preview = " Info",

					custom_title = true,
					icon = "",
				},
				["SUCCESS"] = {
					hl = "MarkviewBlockQuoteOk",
					preview = "󰗠 Success",

					title = true,
					icon = "󰗠",
				},
				["CHECK"] = {
					hl = "MarkviewBlockQuoteOk",
					preview = "󰗠 Check",

					title = true,
					icon = "󰗠",
				},
				["DONE"] = {
					hl = "MarkviewBlockQuoteOk",
					preview = "󰗠 Done",

					title = true,
					icon = "󰗠",
				},
				["QUESTION"] = {
					hl = "MarkviewBlockQuoteWarn",
					preview = "󰋗 Question",

					title = true,
					icon = "󰋗",
				},
				["HELP"] = {
					hl = "MarkviewBlockQuoteWarn",
					preview = "󰋗 Help",

					title = true,
					icon = "󰋗",
				},
				["FAQ"] = {
					hl = "MarkviewBlockQuoteWarn",
					preview = "󰋗 Faq",

					title = true,
					icon = "󰋗",
				},
				["FAILURE"] = {
					hl = "MarkviewBlockQuoteError",
					preview = "󰅙 Failure",

					title = true,
					icon = "󰅙",
				},
				["FAIL"] = {
					hl = "MarkviewBlockQuoteError",
					preview = "󰅙 Fail",

					title = true,
					icon = "󰅙",
				},
				["MISSING"] = {
					hl = "MarkviewBlockQuoteError",
					preview = "󰅙 Missing",

					title = true,
					icon = "󰅙",
				},
				["DANGER"] = {
					hl = "MarkviewBlockQuoteError",
					preview = " Danger",

					title = true,
					icon = "",
				},
				["ERROR"] = {
					hl = "MarkviewBlockQuoteError",
					preview = " Error",

					title = true,
					icon = "",
				},
				["BUG"] = {
					hl = "MarkviewBlockQuoteError",
					preview = " Bug",

					title = true,
					icon = "",
				},
				["EXAMPLE"] = {
					hl = "MarkviewBlockQuoteSpecial",
					preview = "󱖫 Example",

					title = true,
					icon = "󱖫",
				},
				["QUOTE"] = {
					hl = "MarkviewBlockQuoteDefault",
					preview = " Quote",

					title = true,
					icon = "",
				},
				["CITE"] = {
					hl = "MarkviewBlockQuoteDefault",
					preview = " Cite",

					title = true,
					icon = "",
				},
				["HINT"] = {
					hl = "MarkviewBlockQuoteOk",
					preview = " Hint",

					title = true,
					icon = "",
				},
				["ATTENTION"] = {
					hl = "MarkviewBlockQuoteWarn",
					preview = " Attention",

					title = true,
					icon = "",
				},

				["NOTE"] = {
					hl = "MarkviewBlockQuoteNote",
					preview = "󰋽 Note",

					title = true,
					icon = "󰋽",
				},
				["TIP"] = {
					hl = "MarkviewBlockQuoteOk",
					preview = " Tip",

					title = true,
					icon = "",
				},
				["IMPORTANT"] = {
					hl = "MarkviewBlockQuoteSpecial",
					preview = " Important",

					title = true,
					icon = "",
				},
				["WARNING"] = {
					hl = "MarkviewBlockQuoteWarn",
					preview = " Warning",

					title = true,
					icon = "",
				},
				["CAUTION"] = {
					hl = "MarkviewBlockQuoteError",
					preview = "󰳦 Caution",

					title = true,
					icon = "󰳦",
				}
			},
		}
	}
}
