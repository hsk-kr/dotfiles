return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim",
	},
	init = function()
		require("custom.codecompanion-fidget-spinner"):init()
	end,
	config = function()
		require("codecompanion").setup({
			display = {
				chat = {
					intro_message = "I'm supporting you!💪 let's go Lico!🚀",
				},
			},
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

		vim.api.nvim_set_keymap("n", "<leader>cq", ":CodeCompanionChat Toggle<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>cc", ":CodeCompanion<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ca", ":CodeCompanionActions<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("v", "<leader>cc", ":CodeCompanion ", { noremap = true, silent = true })
	end,
}
