local opt = vim.opt
opt.hidden = true
opt.confirm = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.splitright = true
opt.splitbelow = true
opt.inccommand = "split"
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"
opt.updatetime = 250
opt.scrolloff = 8
opt.termguicolors = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.showmode = false

--NEW THINGS FROM KICKSTART
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

-- Temporarily enabled again, wl-clipboard is not being detected
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = true,
	}
end
