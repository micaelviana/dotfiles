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

-- acho que tira um pedaco do header
logo = string.rep("\n", 2) .. logo

return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    opts = {
        theme = 'doom',
        config = {
            -- Set header
            header = vim.split(logo, "\n"),
            center = {
                {
                    icon = '  ',
                    desc = 'New File',
                    key = 'n',
                    action = 'enew',
                    key_format = ' %s',
                },
                {
                    icon = ' 󰁯 ',
                    desc = 'Recent Files',
                    key = 'r',
                    action = 'lua require("fzf-lua").oldfiles()',
                    key_format = ' %s',
                },
                {
                    icon = '  ',
                    desc = 'Find Files',
                    key = 'f',
                    action = 'lua require("fzf-lua").files()',
                    key_format = ' %s',
                },
                {
                    icon = ' 󰗊 ',
                    desc = 'Grep text',
                    key = 'g',
                    action = 'lua require("fzf-lua").live_grep()',
                    key_format = ' %s',
                },
                {
                    icon = ' 󰜎 ',
                    desc = 'Quit neovim',
                    key = 'q',
                    action = 'quit',
                    key_format = ' %s',
                }
            },
            footer = {}
        },
    }
}
