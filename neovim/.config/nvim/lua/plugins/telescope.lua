return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      {
          "nvim-telescope/telescope-frecency.nvim",
          version = "^0.9.0",
      },
      "nvim-tree/nvim-web-devicons", -- Para ícones
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
        },
        extensions = {
          media_files = {
            -- Configurações específicas para media_files
            filetypes = { "png", "jpg", "mp4", "webm", "pdf" },
            find_cmd = "rg", -- Comando usado para encontrar arquivos
          },
          frecency = {
            -- Configurações específicas para frecency
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = { "*.git/*", "*/tmp/*" },
          },
        },
      })

      -- Carregar extensões
      telescope.load_extension("media_files")
      telescope.load_extension("frecency")

      -- Mapeamentos de teclas
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "tb", builtin.builtin, {})
      vim.keymap.set("n", "tr", builtin.oldfiles, {})
      vim.keymap.set("n", "tg", builtin.live_grep, {})
    end,
  },
}
