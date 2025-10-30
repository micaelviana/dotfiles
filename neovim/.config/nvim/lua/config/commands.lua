vim.api.nvim_create_user_command("FormatClipboard", "%s/\r/", {})
vim.keymap.set(
	"n",
	"<space>t", --format clipboard
	function()
		vim.cmd("FormatClipboard")
		vim.cmd([[normal! '']])
	end,
	{ noremap = true, silent = true, desc = "Fix Windows weird clipboard behaviour" }
)

--Select a file using Fuzzy finder
vim.api.nvim_create_user_command("GoToFile", 'lua require("fzf-lua").files({fd_opts = "--color=never --type f --hidden --follow --no-ignore --exclude .git --exclude node_modules"})', {})
