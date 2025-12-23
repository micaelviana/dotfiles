-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch" })
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

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local dir = vim.fn.expand("<afile>:p:h")
		if vim.fn.isdirectory(dir) == 0 then
			vim.fn.mkdir(dir, "p")
		end
	end,
})

-- LSP-integrated file renaming for Oil
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions[1].type == "move" then
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})
