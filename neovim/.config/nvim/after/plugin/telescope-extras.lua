-- Eu nao estava conseguindo fazer isso funcionar no outro arquivo
vim.keymap.set("n", "<space>p",":Telescope frecency workspace=CWD <cr>", {desc="Frecency"})
vim.keymap.set("n", "tf", ":Telescope frecency workspace=CWD <cr>", {})
