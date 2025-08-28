"-----------PACKAGE MANAGER------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
"List of plugins
call plug#begin('~/.vim/plugged')
"    Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete + LSP 
    "Themes
    Plug 'arcticicestudio/nord-vim' 
    Plug 'crusoexia/vim-monokai'
    Plug 'itchyny/lightline.vim' "statusline
    "Autocomplete
    Plug 'lifepillar/vim-mucomplete'
    "Utilities
    Plug 'sheerun/vim-polyglot' "while Treesitter is not here
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
    Plug 'psliwka/vim-smoothie' "Smooth scrolling for Vim done right
    Plug 'haya14busa/is.vim' "is.vim - incremental search improved
    Plug 'lambdalisue/suda.vim'
    Plug 'christoomey/vim-tmux-navigator'
    "fuzzy file finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary' "commentary.vim: comment stuff out
call plug#end()
"----------GENERAL----------
syntax enable
filetype on
filetype plugin on
set incsearch
set nocompatible
set hidden "Keep multiple buffers open
set number relativenumber "Display line numbers
set cursorline "highlit cursor line
set mouse=a "enable mouse interaction
set ignorecase "disable case sensitive in search and commands
set smartcase
set splitright splitbelow "define which way the splits open
set clipboard+=unnamedplus "Copy/paste between vim and other programs.
"indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

"When and how to draw the signcolumn.
set signcolumn=yes
"Everyone shares this setting
set backspace=indent,eol,start
"Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable 
"delays and poor user experience.
set updatetime=300

set scrolloff=8 "Minimal number of screen lines to keep above and below the cursor.
if has('termguicolors')  "enable terminal colors
    set termguicolors  
endif
" Disable all backup files
set nobackup nowritebackup noswapfile

"---------------AUTOCOMMANDS
"autocmd BufEnter * silent! lcd %:p:h "change directory automaticcaly
"Open images from VIM on Linux
augroup OpenImages
      autocmd BufEnter *.png,*.jpg,*gif exec "! feh ".expand("%" ) | :bwipeout
augroup END
"---------------COMMANDS
"remove M^ characters
command! WindowsCleaning %s/\r/

"---------------FUNCTIONS
"command to change the working directory to the directory of the current file
function ChangeCurrentDirectory()
    lcd %:p:h
    pwd
endfunction
nnoremap<space>z :call ChangeCurrentDirectory()  <cr>

"----------KEYMAPS----------
"set mapleader
let mapleader = " "
"new lines
nnoremap <return> o<esc>
"save and close
nnoremap <silent><leader>w :w <cr>
nnoremap <silent><leader>q :xa <cr>
nnoremap <silent> \w :w <cr>
nnoremap <silent> \q :xa <cr>
nnoremap <silent> \z :xa <cr>
"Close without save
nnoremap <silent> Q :qa!<cr> 
nnoremap <silent> <space>a ggVG
"make executable
nnoremap <silent><space>x :!chmod +x %<cr>
"close Split
nnoremap <silent> <space>e :close<cr>
"paste in insert mode using Ctrl+V
inoremap<c-v> <esc>pa
"go to normal mode
nnoremap e :
vnoremap e :
"Go to the end of the next word(because remap)
nnoremap <silent> se e
"search text
nnoremap r /
"find character(because remap)
nnoremap sr r
"select all
nnoremap sa ggVG
"search text in normal mode
nnoremap ss /
"set filetype
nnoremap <leader>sf :set filetype=
"increment/decrement
nnoremap + <c-a>
nnoremap - <c-x>
"replace selected content faster
nnoremap ( :%s///g<Left><Left>
" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x

"Splits
nnoremap <silent> sh <cmd>sp<cr>
nnoremap <silent> sv <cmd>vsp<cr>

"Move line up and down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

"Persistent indentation on visual mode
vnoremap <silent> < <gv 
vnoremap <silent> > >gv 


"{{From plugins}}
"lightline just works in VIM if you put this
set laststatus=2
let g:lightline={'colorscheme':'nord'}
"fzf
nnoremap <c-p> :Files <cr>
nnoremap tf :Files <cr>
"vim-mucomplete
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion message
set belloff+=ctrlg " Add only if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" Select the complete menu item like CTRL+y would.
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
colorscheme nord
