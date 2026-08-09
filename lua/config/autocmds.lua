local group = vim.api.nvim_create_augroup("config.autocmds", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	group = group,
	callback = function()
		if vim.fn.mode() == "n" then
			vim.cmd("silent! checktime")
		end
	end,
})

-- Reload without prompting, so an edit on disk wins over an unsaved buffer.
vim.api.nvim_create_autocmd("FileChangedShell", {
	group = group,
	callback = function()
		vim.v.fcs_choice = "reload"
	end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = group,
	callback = function()
		vim.diagnostic.setqflist({ open = false })
	end,
})
