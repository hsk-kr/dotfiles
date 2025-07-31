-------------------------------------
-- Saving work files on exit
-------------------------------------

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
