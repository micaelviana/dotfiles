vim.api.nvim_create_user_command('WindowsCleaning','%s/\r/' , {})
vim.keymap.set('n','<space>c','<cmd>WindowsCleaning<cr>',{noremap=true,silent=true,desc='Fix Windows weird clipboard behaviour'})
