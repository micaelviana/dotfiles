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

--Integration between Snacks rename file function and NvimTree
local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
vim.api.nvim_create_autocmd("User", {
	pattern = "NvimTreeSetup",
	callback = function()
		local events = require("nvim-tree.api").events
		events.subscribe(events.Event.NodeRenamed, function(data)
			if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
				data = data
				Snacks.rename.on_rename_file(data.old_name, data.new_name)
			end
		end)
	end,
})
