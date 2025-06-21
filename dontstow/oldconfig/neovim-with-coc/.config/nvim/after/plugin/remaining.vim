command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd CursorHold * silent call CocActionAsync('highlight')
