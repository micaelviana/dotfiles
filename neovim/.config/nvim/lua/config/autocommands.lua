-- Highlight yank
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch' }
  end,
})

vim.api.nvim_create_autocmd({"BufRead","BufEnter"},{
  pattern="*.pl",
  command = "set filetype=prolog"
})
