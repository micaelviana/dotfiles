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

-- Reload kitty config on save
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "~/.config/kitty/kitty.conf" },
	callback = function()
		vim.fn.system("kitty @ set-config --from-file ~/.config/kitty/kitty.conf")
		-- If you have multiple Kitty windows and want to reload all of them, you can add --match=all to the command:
		--vim.fn.system("kitty @ set-config --from-file ~/.config/kitty/kitty.conf --match=all")
	end,
})
