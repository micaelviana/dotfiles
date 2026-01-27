return {
	--collection
	{ "sainnhe/everforest", name = "everforest", lazy = true },
	{ "sainnhe/sonokai", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "rose-pine/neovim", name = "rose-pine", lazy = true }, --superior light theme
	{ "sainnhe/gruvbox-material", lazy = false },

	--selected one
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		config = function()
			local bg = "light"
			local hour = tonumber(os.date("%H"))
			if hour >= 6 and hour < 18 then
				bg = "light"
			else
				bg = "dark"
			end

			if bg == "dark" then
				vim.opt.background = "dark"
				vim.cmd.colorscheme("gruvbox-material")
			else
				vim.opt.background = "light"
				vim.cmd.colorscheme("rose-pine")
			end
		end,
	},
}
