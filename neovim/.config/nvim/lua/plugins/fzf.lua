return {
	lazy = false,
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<space>B", "<cmd>FzfLua builtin<cr>", desc = "List all fzf commands" },
		{
			"<space>f",
			function()
				require("fzf-lua").files({
					fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git --exclude node_modules --exclude .next",
				})
			end,
			desc = "Find Files",
		},
		{ "tg", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
		{ "to", "<cmd>FzfLua oldfiles<cr>", desc = "Old files" },
		{ "th", "<cmd>FzfLua helptags<cr>", desc = "Help pages" },
		{ "tk", "<cmd>FzfLua keymaps<cr>", desc = "Keymaps" },
		{ "tb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
	},
	config = function()
		--prevent cursor for blinking
		vim.opt.guicursor:remove({ "t:block-blinkon500-blinkoff500-TermCursor" })
	end,
	opts = {},
}
