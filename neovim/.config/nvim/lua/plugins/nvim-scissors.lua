--WARNING: hot reload doesn't work if the .json file was not created before
return {
	"chrisgrieser/nvim-scissors",
	opts = {
		snippetDir = "~/.config/nvim/snippets/",
	},
	keys = {
		{
			"<leader>se",
			function()
				require("scissors").editSnippet()
			end,
			desc = "Snippet: Edit",
		},
		{
			"<leader>sa",
			function()
				require("scissors").addNewSnippet()
			end,
			mode = { "n", "x" },
			desc = "Snippet: Add",
		},
	},
}
