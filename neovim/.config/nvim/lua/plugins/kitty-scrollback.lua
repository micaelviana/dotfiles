return {
	"mikesmithgh/kitty-scrollback.nvim",
	enabled = true,
	lazy = true,
	cmd = {
		"KittyScrollbackGenerateKittens",
		"KittyScrollbackCheckHealth",
		"KittyScrollbackGenerateCommandLineEditing",
	},
	event = { "User KittyScrollbackLaunch" },
	-- version = '*', -- latest stable version, may have breaking changes if major version changed
	-- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
	opts = {},
	-- NOTE: kitty-navigator doesn't quit after yanking to system clipboard, but if I try to enable this config the "yy" command will not going to work anymore
	config = function()
		vim.g.simpler_scrollback = vim.env.SIMPLER_SCROLLBACK or "default"
		if vim.g.simpler_scrollback == "kitty-scrollback" then
			-- yank and quit when using my scrollback config
			vim.keymap.set({ "n", "v" }, "y", [["+y<cmd>q!<cr>]], { desc = "[P]Yank to system clipboard + Quit" })
			-- vim.keymap.set({ "n", "v" }, "q", "<cmd>q!<cr>", { desc = "[P]Quit" })
		end
	end,
}
