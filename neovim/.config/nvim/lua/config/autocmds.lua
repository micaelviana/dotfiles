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

-- LSP-integrated file renaming for Oil
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions[1].type == "move" then
			Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
		end
	end,
})
