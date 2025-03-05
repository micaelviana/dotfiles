-- lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-frecency.nvim",
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
		preview_cutoff = 8,
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

      -- Função para abrir o frecency com workspace=CWD
      local open_frecency = function()
        require("telescope").extensions.frecency.frecency({
          workspace = "CWD", -- Define o workspace como o diretório atual
        })
      end

      local builtin = require("telescope.builtin")
      -- Mapeamentos de teclas
      vim.keymap.set("n", "<space>p", open_frecency, {}) -- Usar frecency para <space>p
      vim.keymap.set("n", "tf", open_frecency, {}) -- Usar frecency para tf
      vim.keymap.set("n", "tb", builtin.builtin, {})
      vim.keymap.set("n", "tr", builtin.oldfiles, {})
      vim.keymap.set("n", "tg", builtin.live_grep, {})
    end,
  },
}
