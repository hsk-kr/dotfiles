return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	opts = {
		keymap = {
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<C-y>"] = { "select_and_accept" },

			["<C-space>"] = { "show", "fallback" },

			["<C-n>"] = { "select_next", "fallback_to_mappings" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },

			["<C-e>"] = { "cancel" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = {
				auto_show = true,
				window = {
					border = "single",
					scrollbar = false,
				},
			},
			menu = {
				scrollbar = false,
				border = "single",
			},
			list = {
				selection = { auto_insert = true },
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
