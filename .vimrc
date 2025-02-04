set nocompatible
set term=kitty
filetype plugin indent on
syntax on
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
 au!

  " For all text files set 'textwidth' to 79 characters.
  autocmd FileType text setlocal textwidth=79
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" Enable Python 3 support (uncomment if python not loading)
if has('python3')
  " python3 import sys
  " python3 print(sys.version)
endif

" execute pathogen#infect()
filetype off                  " required

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-test/vim-test'
Plug 'ycm-core/YouCompleteMe'
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="vertical"
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_compiler_engine = 'lualatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

Plug 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

filetype off
set runtimepath+=/usr/local/share/lilypond/current/vim/
filetype on
syntax on

if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

set tabstop=2
set shiftwidth=2
set expandtab

set encoding=utf-8

set nu

set termguicolors
set background=dark
let g:gruvbox_bold=1
let g:gruvbox_italic=1
let g:gruvbox_underline=1
let g:gruvbox_undercurl=1
colorscheme gruvbox

" colorscheme solarized
" hi Normal ctermbg=none

set splitbelow

set splitright

set laststatus=2

let maplocalleader = ','

" Use the system clipboard for all yank, delete, change, and put operations
set clipboard=unnamedplus
" Yank to system clipboard
vmap <Leader>y "+y
" Paste from system clipboard
nmap <Leader>p "+p
" Additional mappings using xclip for systems where clipboard doesn't persist
vnoremap <silent> <C-c> :w !xclip -selection clipboard<CR><CR>
nnoremap <silent> <C-v> :r !xclip -selection clipboard -o<CR>
