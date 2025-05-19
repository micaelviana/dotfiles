return {
    -- coc
{'neoclide/coc.nvim',branch = 'release',},
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
    'nvim-lua/plenary.nvim',
    "nvim-treesitter/nvim-treesitter",

    {
      'mattn/emmet-vim',
      init = function ()
        vim.g.user_emmet_mode='a'
      end
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
}
