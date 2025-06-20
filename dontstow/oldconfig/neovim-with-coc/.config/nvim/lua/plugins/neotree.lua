return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  keys={
    {'<space>e','<cmd>Neotree toggle<cr>', desc='Open sidebar', silent=true},
    {'<space>E','<cmd>Neotree toggle %:p:h:h reveal<cr>', desc='Open sidebar', silent=true},
  },
  opts = {
    filesystem = {
      filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = true,
      },
    -- fill any relevant options here
    },
  }
}
