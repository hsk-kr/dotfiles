return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				anthropic = function()
					return require("codecompanion.adapters").extend("anthropic", {
						name = "anthropic",
						schema = {
							model = {
								default = "claude-3-5-haiku-20241022",
							},
							num_ctx = {
								default = 16384,
							},
							num_predict = {
								default = -1,
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
			},
		})
	end,
}
