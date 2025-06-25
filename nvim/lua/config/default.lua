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

-- plugins

-- NvimTree
vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Oil
vim.api.nvim_set_keymap("n", "<leader>o", ":Oil<CR>", { noremap = true, silent = true })

-- Diffview
vim.api.nvim_set_keymap("n", "<leader>dvo", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dvc", ":DiffviewClose<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>dvm", "DiffviewOpen origin/master", { noremap = true, silent = true })

-- Neogit
vim.api.nvim_set_keymap("n", "<leader>ng", ":Neogit<CR>", { noremap = true, silent = true })

-- Rest
vim.api.nvim_set_keymap("n", "<leader>rr", ":Rest run<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>rl", ":Rest last<CR>", { noremap = true, silent = true })

-- Prettier
vim.api.nvim_set_keymap("n", "<leader>pt", ":Prettier<CR>", { noremap = true, silent = true })

-- neoclip
vim.api.nvim_set_keymap("n", '<leader>"', ":Telescope neoclip<CR>", { noremap = true, silent = true })

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

-- upscope plugin commands
vim.api.nvim_set_keymap("n", "<leader>fcb", ":LicovimLiveGrepWithClipboard<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fcf", ":LicovimLiveGrepWithCurrentPath<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>upr", ":LicovimTestRunnerRun<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>upd", ":LicovimTestRunnerRunDebug<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>upt", ":LicovimTestRunnerToggle<CR>", { noremap = true, silent = true })

vim.opt.clipboard = "unnamedplus"

-- Auto save session on exit
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		if _G.saving_mode == true then
			vim.cmd("mksession! ~/vim_saving_mode_session.vim")
			-- TODO: not working, this command should be run manually, later need to fix
			-- vim.cmd("bufdo filetype detect")
		end
	end,
})

-- Auto load session on start
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local session_file = vim.fn.expand("~/vim_saving_mode_session.vim")
		if vim.fn.filereadable(session_file) == 1 then
			_G.saving_mode = false
			vim.cmd("source " .. session_file)
			vim.fn.delete(session_file)
		end
	end,
})

vim.api.nvim_create_user_command("QuitVimWithSavingMode", function()
	_G.saving_mode = true
	vim.cmd("qa!")
end, {})

vim.api.nvim_set_keymap("n", "<leader>sq", ":QuitVimWithSavingMode<CR>", { noremap = true, silent = true })

-- key mapping
local set = vim.keymap.set

set("n", "<leader>x", "<cmd>.lua<cr>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<cr>", { desc = "Execute the current file" })

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

-- disable close window shortcuts, accidently pressing those button is so annoying
vim.keymap.set("n", "<C-w>c", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-w>o", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-w>z", "<Nop>", { noremap = true })
vim.keymap.set("n", "<C-w>q", "<Nop>", { noremap = true })

-- reload
-- TODO: not working need to fix
-- vim.keymap.set("n", "<leader>rr", function()
-- 	vim.cmd("source $MYVIMRC")
-- end, { desc = "Reload Neovim config" })
--
