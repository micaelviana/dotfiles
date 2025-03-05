return {
    -- coc
{'neoclide/coc.nvim',branch = 'release',},
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        opts={},
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },

-- install with yarn or npm
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
},

    {
        'https://github.com/nvim-pack/nvim-spectre',
        lazy=true,
            keys={

                { '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {desc = "Toggle Spectre"}},
                { '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {desc = "Search current word"}},
                { '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {desc = "Search current word"}},
                {'<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {desc = "Search on current file"}},
            },--end keys
    },


    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",

    {
        'mg979/vim-visual-multi',
        branch = 'master',
    },

    {
    "karb94/neoscroll.nvim",
    opts={}
    },
    'https://github.com/haya14busa/is.vim',
    'https://github.com/honza/vim-snippets',
    { 'https://github.com/lambdalisue/vim-suda', event = 'VeryLazy' },

    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
} --end table
