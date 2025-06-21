--Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

--Prolog compatibility
vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
	pattern = "*.pl",
	command = "set filetype=prolog",
})

--Handlebars compatibility
vim.api.nvim_create_autocmd({ "BufRead", "BufEnter" }, {
	pattern = "*.handlebars",
	command = "set filetype=html",
})
