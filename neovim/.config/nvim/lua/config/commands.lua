vim.api.nvim_create_user_command('WindowsCleaning','%s/\r/' , {})
vim.keymap.set('n','<space>cw','<cmd>WindowsCleaning<cr>',{noremap=true,silent=true,desc='Fix Windows weird clipboard behaviour'})

--Select a file using Fuzzy finder
vim.api.nvim_create_user_command('GoToFile','lua Snacks.picker.smart()' , {})
