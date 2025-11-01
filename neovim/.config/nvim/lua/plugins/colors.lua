return {
	--collection
	{ "sainnhe/everforest", name = "everforest", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true }, --collection
	{ "sainnhe/sonokai", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },

	--selected one
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nightfox")
		end,
	},
}
