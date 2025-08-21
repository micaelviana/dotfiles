vim.keymap.set("n", "<leader>se", function()
	require("scissors").editSnippet()
end, { desc = "Snippet: Edit" })

-- when used in visual mode, prefills the selection as snippet body
vim.keymap.set({ "n", "x" }, "<leader>sa", function()
	require("scissors").addNewSnippet()
end, { desc = "Snippet: Add" })
