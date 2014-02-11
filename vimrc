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
set smartcase   " be sensitive when there's a capital letter
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
set autoread " Automatically read a file that has changed on disk
set list " Display unprintable characters f12 - switches
set listchars=tab:·\-,trail:·,extends:»,precedes:« " Unprintable chars mapping
set scrolloff=8

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

"" Vundle.vim: Vundle, the plug-in manager for Vim
"" ihttps://github.com/gmarik/Vundle.vim
Bundle 'gmarik/vundle'

"" vim-colorschemes: one colorscheme pack to rule them all!
"" https://github.com/flazz/vim-colorschemes
Bundle 'flazz/vim-colorschemes'

"" ctrlp.vim: Fuzzy file, buffer, mru, tag, etc finder.
"" http://kien.github.com/ctrlp.vim
Bundle 'kien/ctrlp.vim'

"" vim-json: Syntax highlighting for JSON in Vim
"" https://github.com/leshill/vim-json
Bundle 'leshill/vim-json'

"" vim-javascript: Vastly improved Javascript indentation and syntax support
"" in Vim.
"" https://github.com/pangloss/vim-javascript
Bundle 'pangloss/vim-javascript'

"" indent/html.vim : alternative html indent script
"" http://www.vim.org/scripts/script.php?script_id=2075
Bundle 'indenthtml.vim'

"" vim-markdown: Vim Markdown runtime files
"" https://github.com/tpope/vim-markdown
Bundle 'tpope/vim-markdown'

"" fugitive.vim: a Git wrapper so awesome, it should be illegal
"" http://www.vim.org/scripts/script.php?script_id=2975
Bundle 'tpope/vim-fugitive'

"" eunuch.vim : Helpers for UNIX
"" http://www.vim.org/scripts/script.php?script_id=4300
Bundle 'tpope/vim-eunuch'

"" The NERD tree : A tree explorer plugin for navigating the filesystem.
"" http://www.vim.org/scripts/script.php?script_id=1658
Bundle 'The-NERD-tree'

"" numbers.vim: better line numbers for vim.
"" http://myusuf3.github.io/numbers.vim/
Bundle 'myusuf3/numbers.vim'

"" vim-airline: lean & mean status/tabline for vim that's light as air.
"" https://github.com/bling/vim-airline
Bundle 'bling/vim-airline'

"" Syntastic : Automatic syntax checking
"" http://www.vim.org/scripts/script.php?script_id=2736
Bundle 'Syntastic'

"" Tagbar: The Vim class outline viewer
"" http://majutsushi.github.io/tagbar/
Bundle 'Tagbar'

"" neocomplcache: Ultimate auto-completion system for Vim.
"" https://github.com/Shougo/neocomplcache.vim
Bundle 'neocomplcache'

"" gitv: gitk for Vim.
"" https://github.com/gregsexton/gitv
Bundle 'gitv'

"" surround.vim : Delete/change/add parentheses/quotes/XML-tags/much more with
"" ease 
"" http://www.vim.org/scripts/script.php?script_id=1697
Bundle 'surround.vim'

"" Command-T : Fast file navigation for VIM
"" http://www.vim.org/scripts/script.php?script_id=3025
Bundle 'Command-T'

"" The-NERD-Commenter: A plugin that allows for easy commenting of code for many filetypes.
"" ihttp://www.vim.org/scripts/script.php?script_id=1218
Bundle 'The-NERD-Commenter'

"" ack.vim: Vim plugin for the Perl module / CLI script 'ack'
"" https://github.com/mileszs/ack.vim
Bundle 'ack.vim'
let g:ackprg = "ack-grep -H --nocolor --nogroup --column"

"" xmledit: A filetype plugin to help edit XML, HTML, and SGML documents
"" http://www.vim.org/scripts/script.php?script_id=301
Bundle 'xmledit'

"" CloseTag: functions and mappings to close open HTML/XML tags
"" http://www.vim.org/scripts/script.php?script_id=13
Bundle 'closetag.vim'
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako so ~/.vim/bundle/closetag.vim/plugin/closetag.vim

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

set pastetoggle=<F2>

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

