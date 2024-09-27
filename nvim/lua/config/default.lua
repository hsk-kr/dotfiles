vim.wo.relativenumber = true
vim.cmd.colorscheme "catppuccin"

vim.o.number = true
vim.o.ignorecase = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.expandtab = true

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dvo', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dvc', ':DiffviewClose<CR>', { noremap = true, silent = true })


vim.api.nvim_set_option("clipboard", "unnamed")

-- key mapping
local set = vim.keymap.set

set("n", "<leader>x", "<cmd>.lua<cr>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<cr>", { desc = "Execute the current file" })

set('n', '[d', function() vim.diagnostic.goto_prev() end, {})
set('n', ']d', function() vim.diagnostic.goto_next() end, {})
set('n', '<leader>de', function() vim.diagnostic.open_float() end, { noremap = true, silent = true })

set('t', '<C-w>h', "<C-\\><C-n><C-w>h",{silent = true})
