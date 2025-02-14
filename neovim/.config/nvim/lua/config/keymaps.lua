local keyset = vim.keymap.set
local opts = {noremap=true, silent=true}

-- Set mapleader
vim.g.mapleader = " "

-- New lines
keyset('n', '<return>', 'o<esc>', { noremap = true })


-- Save and close
keyset('n', '<leader>w', ':w<cr>', { silent = true, noremap = true })
keyset('n', '<leader>q', ':xa<cr>', { silent = true, noremap = true })
keyset('n', '\\w', ':w<cr>', { silent = true, noremap = true })
keyset('n', '\\q', ':xa<cr>', { silent = true, noremap = true })
keyset('n', '\\z', ':xa<cr>', { silent = true, noremap = true })

--Splits
keyset('n','<space>h','<cmd>sp<cr>',opts)
keyset('n','<space>v','<cmd>vsp<cr>',opts)

-- Persistent indentation on visual mode
keyset('v','<','<gv',opts)
keyset('v','>','>gv',opts)

-- Close without save
keyset('n', 'Q', ':qa!<cr>', { silent = true, noremap = true })

-- Make executable
keyset('n', '<space>x', ':!chmod +x %<cr>', { silent = true, noremap = true })

-- Paste in insert mode using Ctrl+V
keyset('i', '<c-v>', '<esc>pa', { noremap = true })

-- Go to normal mode
keyset('n', 's', ':', { noremap = true })
keyset('v', 's', ':', { noremap = true })

-- Select all
keyset('n', '\\a', 'ggVG', { noremap = true })

-- Increment/decrement
keyset('n', '+', '<c-a>', { noremap = true })
keyset('n', '-', '<c-x>', { noremap = true })

-- Replace selected content faster
keyset('n', '(', ':%s///g<left><left>', { noremap = true })

-- Map Ctrl-Backspace to delete the previous word in insert mode
keyset('i', '<c-bs>', '<c-w>', { noremap = true })
keyset('i', '<c-h>', '<c-w>', { noremap = true })

-- Prevent x from overriding what's in the clipboard
keyset('n', 'x', '"_x', { noremap = true })
keyset('n', 'X', '"_x', { noremap = true })
keyset('n', '<del>', '"_x', { noremap = true })

-- Keymap to change the working directory to the directory of the current file
vim.keymap.set('n', '<space>z', function ()
    vim.cmd('lcd %:p:h')
    vim.cmd('pwd')
end, { noremap = true })
