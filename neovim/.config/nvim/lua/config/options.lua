local opt=vim.opt
opt.hidden=true
opt.confirm=true
opt.number=true
opt.relativenumber=true
opt.cursorline=true
opt.mouse="a"
opt.ignorecase=true
opt.smartcase=true
opt.splitright = true
opt.splitbelow = true
opt.inccommand = 'split'
opt.tabstop=2
opt.softtabstop=2
opt.shiftwidth=2
opt.expandtab=true
opt.autoindent=true
opt.signcolumn='yes'
opt.backspace="indent,eol,start"
opt.updatetime=300
opt.scrolloff=8
opt.termguicolors=true
opt.backup=false
opt.writebackup=false
opt.swapfile=false
opt.showmode=false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

--no longer need, install wl-clipboard
-- if vim.fn.has('wsl') == 1 then
--     vim.g.clipboard = {
--         name = 'win32yank-wsl',
--         copy = {
--             ['+'] =  'win32yank.exe -i --crlf',
--             ['*'] =  'win32yank.exe -i --crlf',
--         },
--         paste = {
--             ['+'] = 'win32yank.exe -o --lf',
--             ['*'] = 'win32yank.exe -o --lf',
--         },
--         cache_enabled = true,
--     }
-- end
