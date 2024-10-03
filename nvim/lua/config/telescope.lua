local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- setup
vim.keymap.set("n", "<leader>cff", function()
  builtin.find_files { cwd = vim.fn.stdpath "config", prompt_title = " neovim" }
end, { desc = "Search neovim files" })
vim.keymap.set("n", "<leader>cfg", function()
  builtin.live_grep { cwd = vim.fn.stdpath "config", prompt_title = " neovim" }
end, { desc = "Search neovim files" })

-- upscope/extension
vim.keymap.set("n", "<leader>1ff", function()
  builtin.find_files { search_dirs = { vim.fn.getcwd() .. "/extension" } , prompt_title = "upscope extensions" }
end, { desc = "Search files in extensions" })
vim.keymap.set("n", "<leader>1fg", function()
  builtin.live_grep { search_dirs = { vim.fn.getcwd() .. "/extension" } , prompt_title = "upscope extensions" }
end, { desc = "Search text in extensions" })

-- upscope/app-frontend
vim.keymap.set("n", "<leader>2ff", function()
  builtin.find_files { search_dirs = { vim.fn.getcwd() .. "/app-frontend" } , prompt_title = "upscope app-frontend" }
end, { desc = "Search files in app-frontend" })
vim.keymap.set("n", "<leader>2fg", function()
  builtin.live_grep { search_dirs = { vim.fn.getcwd() .. "/app-frontend" } , prompt_title = "upscope app-frontend" }
end, { desc = "Search text in app-frontend" })


-- add a mapping for git status
vim.keymap.set("n", "<leader>gs", function()
  builtin.git_status {}
end, { desc = "Git status" });
