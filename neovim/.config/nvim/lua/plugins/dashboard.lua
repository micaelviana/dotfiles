-- local logo=[[
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠉⣁⣀⣀⣐⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠁⣤⣾⣿⣿⣿⣿⣿⣿⣷⡄⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⣀⣾⣿⣿⣿⡿⠛⠁⠠⠤⠤⠉⠓⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⣠⣼⣿⣿⣿⣿⣿⠁⠀⣠⣶⣶⣶⣶⣤⣀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⢠⣴⣿⣿⣿⣿⣿⣿⣿⠀⢰⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⠟⢀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠈⢲⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠛⠛⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⠟⠃⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣈⠛⠛⠟⠛⠛⢛⢉⠉⡀⣠⣆⣀⣻⠀⠀⣰⣿⠿⠛⢙⣿⣿⣿⣿⠿⢻
-- ⡿⠻⠟⠉⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣬⣥⣴⣶⣿⣿⣿⣿⣿⣿⣷⣤⢤⢄⣀⣀⣦⣬⡭⠅⢀⣴⣾
-- ⣶⣶⣶⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿
-- ]]
--
local logo = [[
       /\      
      /\*\     
     /\O\*\    
    /*/\/\/\   
   /\O\/\*\/\  
  /\*\/\*\/\/\ 
 /\O\/\/*/\/O/\
       ||      
       ||      
 ||
 ]]
--
-- -- acho que tira um pedaco do header
logo = string.rep("\n", 2) .. logo
-- --
-- --
return{
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    opts = {
        theme = 'doom',
        config = {
            -- Set header
            header = vim.split(logo,"\n"),
            -- header = {
            --
            --     "                                                     ",
            --     "                                                     ",
            --     "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            --     "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            --     "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            --     "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            --     "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            --     "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            --     "                                                     ",
            -- },
            center = {
                {
                    icon = '  ',
                    desc = 'New File',
                    key = 'n',
                    action = 'enew',
                    key_format = ' %s', -- `%s` will be substituted with value of `key`
                },
                {
                    icon = ' 󰁯 ',
                    desc = 'Recent Files',
                    key = 'r',
                    action = 'lua Snacks.picker.recent()',
                    key_format = ' %s', -- `%s` will be substituted with value of `key`
                },
                {
                    icon = '  ',
                    desc = 'Find Files',
                    key = 'f',
                    action = "lua Snacks.picker.smart()",
                    key_format = ' %s', -- `%s` will be substituted with value of `key`
                },
                {
                    icon = ' 󰗊 ',
                    desc = 'Grep text',
                    key = 'g',
                    action = 'lua Snacks.picker.grep()',
                    key_format = ' %s', -- `%s` will be substituted with value of `key`
                },
                {
                    icon = ' 󰜎 ',
                    desc = 'Quit neovim',
                    key = 'q',
                    action = 'quit',
                    key_format = ' %s', -- `%s` will be substituted with value of `key`
                }
            },
            footer = {}
        },
    }--end opts
} -- end table
