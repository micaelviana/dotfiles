return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
   keys = {
    { "tf", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "tg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "tp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "tr", function() Snacks.picker.recent() end, desc = "Recent" },
    { "th", function() Snacks.picker.help() end, desc = "Help pages" },
    { "th", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    --Other
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
  }
}
