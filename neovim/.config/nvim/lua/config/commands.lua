vim.api.nvim_create_user_command('FormatClipboard','%s/\r/' , {})
vim.keymap.set('n','<space>t', --format clipboard
function ()
 vim.cmd('FormatClipboard')
 vim.cmd([[normal! '']])
end,
{noremap=true,silent=true,desc='Fix Windows weird clipboard behaviour'})
