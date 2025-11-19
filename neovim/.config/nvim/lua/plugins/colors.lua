return {
	--collection
	{ "sainnhe/everforest", name = "everforest", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true }, --superior light theme

	--selected one
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			local bg = os.getenv("BACKGROUND") or "dark"
			vim.opt.background = bg
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
