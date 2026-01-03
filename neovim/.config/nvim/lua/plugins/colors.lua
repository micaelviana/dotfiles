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
			local bg = os.getenv("BACKGROUND")
			if not bg then
				local hour = tonumber(os.date("%H"))
				if hour >= 6 and hour < 18 then
					bg = "light"
				else
					bg = "prefer-dark"
				end
			end

			if bg == "prefer-dark" then
				vim.opt.background = "dark"
				vim.cmd.colorscheme("everforest")
			else
				vim.opt.background = "light"
				vim.cmd.colorscheme("rose-pine")
			end
		end,
	},
}
