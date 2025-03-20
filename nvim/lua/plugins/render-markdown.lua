return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = {
		"markdown",
		"octo",
		"codecompanion",
	},
	dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim", "nvim-tree/nvim-web-devicons" },
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		file_types = {
			"markdown",
			"octo",
			"codecompanion",
		},
		completions = {
			lsp = {
				enabled = true,
			},
		},
	},
}
