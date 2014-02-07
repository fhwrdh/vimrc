set nocompatible
filetype off

set hidden
set history=1000
set undolevels=1000

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Match and search
set hlsearch    " highlight search
set ignorecase  " Do case in sensitive matching with
set smartcase	" be sensitive when there's a capital letter
set incsearch

" Visual
set number
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set autoread
set list " Display unprintable characters f12 - switches
set listchars=tab:·\-,trail:·,extends:»,precedes:« " Unprintable chars mapping
set scrolloff=2

" Text Formatting
set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set nosmarttab

" Vundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'kien/ctrlp.vim'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'indenthtml.vim'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-eunuch'
Bundle 'The-NERD-tree'
Bundle 'myusuf3/numbers.vim'
Bundle 'bling/vim-airline'
Bundle 'Syntastic'
Bundle 'Tagbar'
Bundle 'neocomplcache'



" Brief help
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

colo 256-grayvim
syntax on       " enable syntax highlighting
filetype plugin indent on

" leader is a key that allows you to have your own "namespace" of keybindings.
let mapleader = ","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" numbers.vim
let g:enable_numbers = 0
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" clear the highlighting of :set hlsearch.
nnoremap <leader>n :nohls<CR>

" Alright... let's try this out / map 'jj' to <esc>
imap jj <esc>
cmap jj <esc>

" make regexp search use the more familiar regex syntax
"nnoremap / /\v
"nnoremap / /\v

" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" toggle NERDTree plugin
map <silent> <leader>d :NERDTreeToggle<CR>

