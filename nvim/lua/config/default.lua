--vim.wo.relativenumber = true
vim.o.number = true
vim.cmd.colorscheme "catppuccin"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, {})
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, {})
vim.keymap.set('n', '<leader>de', function() vim.diagnostic.open_float() end, { noremap = true, silent = true })
