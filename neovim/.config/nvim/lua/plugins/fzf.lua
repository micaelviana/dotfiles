return{
  lazy=false,
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  keys={
    {'<space>bb','<cmd>FzfLua builtin<cr>'},
    { "<space>ff", '<cmd>FzfLua files<cr>', desc = "Find Files" },
    { "tg", '<cmd>FzfLua live_grep<cr>', desc = "Grep" },
    { "to", '<cmd>FzfLua oldfiles<cr>', desc = "Old files" },
    { "th", '<cmd>FzfLua helptags<cr>', desc = "Help pages" },
    { "tk", '<cmd>FzfLua keymaps<cr>', desc = "Keymaps" },
    { "tb", '<cmd>FzfLua buffers<cr>', desc = "Buffers" },
  },
  config = function () 
    --Select a file using Fuzzy finder
    vim.api.nvim_create_user_command('GoToFile','lua require("fzf-lua").files()',{})
  end,
  opts = {}
}
