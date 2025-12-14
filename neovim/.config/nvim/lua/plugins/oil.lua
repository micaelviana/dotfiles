return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = {
			-- Show files and directories that start with "."
			show_hidden = true,
		},
		float = {
			max_width = 0.7,
			max_height = 0.6,
			border = "rounded",
		},
	},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	keys = { { "<space>-", "<CMD>Oil --float<CR>", desc = "Open parent directory" } },
	lazy = false,
}
