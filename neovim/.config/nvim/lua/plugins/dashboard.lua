local logo=[[
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠉⣁⣀⣀⣐⠈⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠁⣤⣾⣿⣿⣿⣿⣿⣿⣷⡄⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⣀⣾⣿⣿⣿⡿⠛⠁⠠⠤⠤⠉⠓⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⣠⣼⣿⣿⣿⣿⣿⠁⠀⣠⣶⣶⣶⣶⣤⣀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⢠⣴⣿⣿⣿⣿⣿⣿⣿⠀⢰⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠟⢀⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠈⢲⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠛⠛⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⠟⠃⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣈⠛⠛⠟⠛⠛⢛⢉⠉⡀⣠⣆⣀⣻⠀⠀⣰⣿⠿⠛⢙⣿⣿⣿⣿⠿⢻
⡿⠻⠟⠉⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣬⣥⣴⣶⣿⣿⣿⣿⣿⣿⣷⣤⢤⢄⣀⣀⣦⣬⡭⠅⢀⣴⣾
⣶⣶⣶⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿
]]

--  local logo = [[
--       /\      
--      /\*\     
--     /\O\*\    
--    /*/\/\/\   
--   /\O\/\*\/\  
--  /\*\/\*\/\/\ 
-- /\O\/\/*/\/O/\
--       ||      
--       ||      
-- ||
-- ]]
--
-- -- acho que tira um pedaco do header
logo = string.rep("\n", 3) .. logo
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
                    action = 'enew'
                },
                {
                    icon = ' 󰁯 ',
                    desc = 'Recent Files',
                    key = 'r',
                    action = 'Telescope oldfiles'
                },
                {
                    icon = '  ',
                    desc = 'Find Files',
                    key = 'f',
                    action = 'Telescope frecency workspace=CWD path_display={"shorten"} '
                },
                {
                    icon = ' 󰗊 ',
                    desc = 'Grep text',
                    key = 'g',
                    action = 'Telescope live_grep'
                },
                {
                    icon = ' 󰜎 ',
                    desc = 'Quit neovim',
                    key = 'q',
                    action = 'quit'
                }
            },
            footer = {}
        }
    }--end opts
} -- end table
