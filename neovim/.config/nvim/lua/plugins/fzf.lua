return{
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  keys={
    {'<space>b','<cmd>FzfLua builtin<cr>'},
  },
  opts = {}
}
