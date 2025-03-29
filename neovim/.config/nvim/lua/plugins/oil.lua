return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = { show_hidden = true },
    default_file_explorer = true,
  },
  keys = {
    {
      '<space>f',
      function()
        require('oil').open_float()
      end,
      desc = 'Open parent directory with oil',
    },
  },
  lazy=false
}
