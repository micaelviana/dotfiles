return {
	--collection
	{ "sainnhe/everforest", name = "everforest", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },

	--selected one
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			local bg = os.getenv("BACKGROUND") or "dark"
			vim.opt.background = bg
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme("everforest")
		end,
	},
}
