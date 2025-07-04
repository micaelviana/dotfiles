-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local colorscheme_repo = "folke/tokyonight.nvim"
local colorscheme_name = "tokyonight-storm"
require("lazy").setup({
	change_detection = { notify = false },
	checker = {
		enabled = false, -- automatically check for plugin updates
		notify = false, -- get a notification when new updates are found
	},
	spec = {
		--colorschemes
		{ "sainnhe/everforest", name = "everforest", lazy = true },
		{ "EdenEast/nightfox.nvim", lazy = true }, --collection
		{ "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true },
		{ "sainnhe/sonokai", lazy = true },
		{ "folke/tokyonight.nvim", lazy = true },

		--selected one
		{
			colorscheme_repo,
			lazy = false,
			priority = 1000,
			config = function()
				vim.cmd.colorscheme(colorscheme_name)
			end,
			opts = {},
		},
		{ import = "plugins" },
	}, --end spec,
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
