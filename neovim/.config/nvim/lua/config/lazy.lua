-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local colorscheme_repo = "rebelot/kanagawa.nvim"
local colorscheme_name = "kanagawa-dragon"

-- Setup lazy.nvim
require("lazy").setup({
    change_detection = { notify = false },
    checker = {
        enabled = false, -- automatically check for plugin updates
        notify = false, -- get a notification when new updates are found
    },
    spec = {

    --colorschemes
    {'sainnhe/everforest',name = 'everforest', lazy=true},
    { "EdenEast/nightfox.nvim",     lazy = true }, --collection 
    { "bluz71/vim-nightfly-colors", name = "nightfly",   lazy = true },
    { 'sainnhe/sonokai',            lazy = true },
    {"folke/tokyonight.nvim", lazy=true},
    { "rebelot/kanagawa.nvim", lazy=true},

    --selected one
    {
      colorscheme_repo,
      lazy = false,
      priority = 1000,
        config = function ()
            vim.cmd.colorscheme(colorscheme_name)
        end,
      opts = {},
    },

    --IMPORT YOUR PLUGINS
    {import='plugins'},
    },
-- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { colorscheme_name} },
})

