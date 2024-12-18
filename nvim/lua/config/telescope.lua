local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- live_grep_args
vim.keymap.set("n", "<leader>fg", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Live Grep Args" })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- setup
vim.keymap.set("n", "<leader>cff", function()
  builtin.find_files { cwd = "~/.config/dotfiles", prompt_title = " dotfile" }
end, { desc = "Search neovim files" })
vim.keymap.set("n", "<leader>cfg", function()
  builtin.live_grep { cwd = "~/.config/dotfiles", prompt_title = " dotfile" }
end, { desc = "Search neovim files" })

-- add a mapping for git status
vim.keymap.set("n", "<leader>gs", function()
  builtin.git_status {}
end, { desc = "Git status" });

vim.keymap.set("n", "<leader>gb", function()
  builtin.git_branches {}
end, { desc = "Git branches" });
