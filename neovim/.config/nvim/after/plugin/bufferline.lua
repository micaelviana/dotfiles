local keyset = vim.keymap.set
local opts = {noremap=true, silent=true}

keyset('n', 'H', ':bprevious<cr>', opts)
keyset('n', 'L', ':bnext<cr>', opts)
