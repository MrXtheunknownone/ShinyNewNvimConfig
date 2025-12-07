return {
	"saghen/blink.cmp",
	dependencies = {
            "rafamadriz/friendly-snippets",
    },
	version = "1.*",
	opts = {
		keymap = { preset = "default" },
		appearance = {
			-- TODO: Set the nerdfont
			nerd_font_variant = "mono",
		},
		completion = { documentation = { auto_show = true } },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		},
		-- providers = {
		-- 	lazydev = {
		-- 		name = "LazyDev",
		-- 		module = "lazydev.integrations.blink",
		-- 		score_offset = 100,
		-- 	},
		-- },
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
