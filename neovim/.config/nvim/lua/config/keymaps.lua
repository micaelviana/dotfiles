local keyset = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set mapleader
vim.g.mapleader = " "

-- New lines
keyset("n", "<return>", "o<esc>", { noremap = true })

--Select all
vim.keymap.set("n", "sa", "ggVG", { noremap = true, silent = true })

--Set filetype
vim.keymap.set("n", "<leader>sf", ":set filetype=", { noremap = true, silent = false })

-- Save and close
keyset("n", "<leader>w", ":w<cr>", opts)
keyset("n", "<leader>q", ":xa<cr>", opts)
keyset("n", "\\w", ":w<cr>", opts)
keyset("n", "\\q", ":xa<cr>", opts)
keyset("n", "\\z", ":xa<cr>", opts)

-- Splits
keyset("n", "sh", ":split<cr>", opts)
keyset("n", "sv", ":vsplit<cr>", opts)

--Move line up and down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move Line Up in Visual Mode" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move Line Down in Visual Mode" })

-- Persistent indentation on visual mode
keyset("v", "<", "<gv", opts)
keyset("v", ">", ">gv", opts)

-- Close without save
keyset("n", "Q", ":qa!<cr>", { silent = true, noremap = true })

-- Make executable
keyset("n", "<space>x", ":!chmod +x %<cr>", { silent = true, noremap = true })

--Close Split
vim.keymap.set("n", "<space>c", ":close<cr>", { noremap = true, silent = true })

-- Paste in insert mode using Ctrl+V
keyset("i", "<c-v>", "<esc>pa", { noremap = true })

-- Go to normal mode
keyset({ "n", "v" }, "e", ":", { noremap = true })
--Go to the end of the next word(because remap)
keyset("n", "se", "e", opts)

--Search text
keyset("n", "r", "/", { noremap = true })
--find character(because remap)
keyset("n", "sr", "r", { noremap = true })

-- Select all
keyset("n", "\\a", "ggVG", { noremap = true })

-- Increment/decrement
keyset("n", "+", "<c-a>", { noremap = true })
keyset("n", "-", "<c-x>", { noremap = true })

-- Replace selected content faster
keyset("n", "(", ":%s///g<left><left>", { noremap = true })

-- Map Ctrl-Backspace to delete the previous word in insert mode
keyset("i", "<c-bs>", "<c-w>", { noremap = true })
keyset("i", "<c-h>", "<c-w>", { noremap = true })

-- Prevent x from overriding what's in the clipboard
keyset({ "n", "v" }, "x", '"_x', { noremap = true })
keyset({ "n", "v" }, "X", '"_x', { noremap = true })
keyset({ "n", "v" }, "<del>", '"_x', { noremap = true })

-- Keymap to change the working directory to the directory of the current file
vim.keymap.set("n", "<space>z", function()
	vim.cmd("lcd %:p:h")
	vim.cmd("pwd")
end, { noremap = true })
