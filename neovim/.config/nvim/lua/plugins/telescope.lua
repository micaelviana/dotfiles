-- I want to create a keymap to split Vim horizontally, followed by the Telescope file picker to choose the file I want to work with. But this is not working. The split happens, but the Telescope doesn't show.
-- Below is my telescope config:
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-tree/nvim-web-devicons", -- For icons
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        -- preview_cutoff = 10,
        },
        extensions = {
          frecency = {
            -- Specific settings for frecency
            show_scores = false,
            show_unindexed = true,
            ignore_patterns = { ".git/", "/tmp/" },
          },
        },
      })
      -- Load extensions
      telescope.load_extension("frecency")
      -- Function to open frecency with workspace=CWD
      local open_frecency = function()
        require("telescope").extensions.frecency.frecency({
          workspace = "CWD", -- Set the workspace to the current directory
          path_display={"shorten"}
        })
      end
      local builtin = require("telescope.builtin")
      -- Key mappings
      vim.keymap.set("n", "tf", open_frecency, {}) -- Use frecency for tf
      vim.keymap.set("n", "<space>p", open_frecency, {}) -- Use frecency for <space>p
      vim.keymap.set("n", "tb", builtin.builtin, {})
      vim.keymap.set("n", "tr", builtin.oldfiles, {})
      vim.keymap.set("n", "tg", builtin.live_grep, {})
--Here
      vim.keymap.set('n','<space>h',function ()
          vim.cmd('split')
	  vim.cmd('Telescope find_files')
      end,{noremap=true,silent=true,desc=''})
    end,
  },
}
