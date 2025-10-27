-- plugins

-- NvimTree
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Oil
vim.api.nvim_set_keymap("n", "<leader>o", ":Oil<CR>", { noremap = true, silent = true })

-- Diffview
vim.api.nvim_set_keymap("n", "<leader>dvo", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dvc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dvm", ":DiffviewOpen origin/master<CR>", { noremap = true, silent = true })

-- Neogit
vim.api.nvim_set_keymap("n", "<leader>ng", ":Neogit<CR>", { noremap = true, silent = true })

-- Rest
vim.api.nvim_set_keymap("n", "<leader>rr", ":Rest run<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rl", ":Rest last<CR>", { noremap = true, silent = true })

-- neoclip
vim.api.nvim_set_keymap("n", '<leader>"', ":Telescope neoclip<CR>", { noremap = true, silent = true })

-- lsp
vim.api.nvim_set_keymap("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })

-- Custom
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mm", ":e ~/memo<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>mr", ":e ~/rest.http<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cp", ":cprev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cn", ":cn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>ca",
	":lua vim.fn.setreg('+', vim.fn.fnamemodify(vim.fn.expand('%:p'),':.'))<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { silent = true }) -- to exit from the terminal

vim.keymap.set("n", "<leader>x", "<cmd>.lua<cr>", { desc = "Execute the current line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<cr>", { desc = "Execute the current file" })

vim.keymap.set("n", "<leader>de", function()
	vim.diagnostic.open_float()
end, { noremap = true, silent = true })

-- upscope plugin commands
vim.api.nvim_set_keymap("n", "<leader>fcb", ":LicovimLiveGrepWithClipboard<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fcf", ":LicovimLiveGrepWithCurrentPath<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>upr", ":LicovimTestRunnerRun<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>upd", ":LicovimTestRunnerRunDebug<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>upt", ":LicovimTestRunnerToggle<CR>", { noremap = true, silent = true })

-- disable close window shortcuts, accidently pressing those button is so annoying
vim.keymap.set("n", "<C-w>c", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-w>o", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-w>z", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-w>q", "<Nop>", { noremap = true })
