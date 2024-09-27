local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>rp", function()
  builtin.find_files { cwd = vim.fn.stdpath "config", prompt_title = " neovim" }
end, { desc = "Search neovim files" })

-- upscope
vim.keymap.set("n", "<leader>1ff", function()
  builtin.find_files { search_dirs = { vim.fn.getcwd() .. "/extension" } , prompt_title = "upscope extensions" }
end, { desc = "Search files in extensions" })
vim.keymap.set("n", "<leader>1fg", function()
  builtin.live_grep { search_dirs = { vim.fn.getcwd() .. "/extension" } , prompt_title = "upscope extensions" }
end, { desc = "Search text in extensions" })
