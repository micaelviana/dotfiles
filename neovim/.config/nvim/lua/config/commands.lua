vim.api.nvim_create_user_command('WindowsCleaning','%s/\r/' , {})
vim.keymap.set('n','<space>cw',
function ()
 vim.cmd('WindowsCleaning')
 vim.cmd([[normal! '']])
end,
{noremap=true,silent=true,desc='Fix Windows weird clipboard behaviour'})

