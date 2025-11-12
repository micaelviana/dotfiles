return {
	--collection
	{ "sainnhe/everforest", name = "everforest", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },

	--selected one
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.background = "light"
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme("everforest")
		end,
	},
}
