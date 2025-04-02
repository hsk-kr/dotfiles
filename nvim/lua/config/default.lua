vim.wo.relativenumber = true

vim.filetype.add({
	extension = {
		graphqls = "graphql",
	},
})

vim.o.number = true
vim.o.ignorecase = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.signcolumn = "yes"
vim.o.ignorecase = false

-- plugins

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>r", ":GrugFar<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>o", ":Oil<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dvo", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dvc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ng", ":Neogit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>m", ":e ~/memo<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", '<leader>"', ":Telescope neoclip<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fcb", ":LicovimLiveGrepWithClipboard<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fcf", ":LicovimLiveGrepWithCurrentPath<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>upt", ":LicovimUpscopeTestCurrentFile<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cn", ":cn<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>pt", ":Prettier<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>cp",
	":lua vim.fn.setreg('+', vim.fn.fnamemodify(vim.fn.expand('%:p'),':.'))<CR>",
	{ noremap = true, silent = true }
)

vim.opt.clipboard = "unnamed"
vim.api.nvim_set_option("clipboard", "unnamed")

-- key mapping
local set = vim.keymap.set

set("n", "<leader>x", "<cmd>.lua<cr>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<cr>", { desc = "Execute the current file" })

set("n", "[d", function()
	vim.diagnostic.goto_prev()
end, {})
set("n", "]d", function()
	vim.diagnostic.goto_next()
end, {})
set("n", "<leader>de", function()
	vim.diagnostic.open_float()
end, { noremap = true, silent = true })

set("t", "<C-w>h", "<C-\\><C-n><C-w>h", { silent = true })

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
		},
	},
})
