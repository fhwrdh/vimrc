set nocompatible
filetype off

" Vundle stuff
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Brief help
" :PluginInstall(!)    - install (update) bundles
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Vundle.vim: Vundle, the plug-in manager for Vim """""""""""""""""""""""""""
"" https://github.com/gmarik/Vundle.vim
Plugin 'gmarik/Vundle.vim'

"" eunuch.vim : Helpers for UNIX
"" http://www.vim.org/scripts/script.php?script_id=4300
Plugin 'tpope/vim-eunuch'

"" The NERD tree : A tree explorer plugin for navigating the filesystem. """""
Plugin 'scrooloose/nerdtree'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache_    _']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"" vim-commentary: comment stuff out
"" https://github.com/tpope/vim-commentary
Plugin 'tpope/vim-commentary'

"" fugitive.vim: a Git wrapper so awesome, it should be illegal
"" http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'tpope/vim-fugitive'

"" vim-gitgutter: A Vim plugin which shows a git diff in the gutter """"""""""
"" (sign column) and stages/reverts hunks.
"" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

"" 'You don't have to do anything: it just works.'
"" gitv: gitk for Vim.
"" https://github.com/gregsexton/gitv
Plugin 'gitv'

"" ctrlp.vim: Fuzzy file, buffer, mru, tag, etc finder. """"""""""""""""""""""
"" http://kien.github.com/ctrlp.vim
"" :help ctrlp-options
Plugin 'kien/ctrlp.vim'
"Once CtrlP is open:
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
let g:ctrlp_map = '<c-p>'
" When invoked, unless a starting directory is specified, CtrlP will set its
" local working directory according to this variable.
" 'c' - the directory of the current file.
" 'r' - the nearest ancestor that contains one of these directories or files:
" .git .hg .svn .bzr _darcs, and your own root markers defined with the
" g:ctrlp_root_markers option.
" 'a' - like 'c', but only applies when the current working directory outside
" of CtrlP isn't a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.
let g:ctrlp_working_path_mode = 'ra'
" exclude files or directory from search
" with vim script regexp, needs to escape |, + as well
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|node_modules$\|vendor$\|.*cache$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store " MacOSX/Linux
" use custom file listing command
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:50'
" Max MRU entries to remember
let g:ctrlp_mruf_max = 50
" additional keyboard shortcuts
nnoremap <leader>m :CtrlPMRUFiles<CR>

"" vim-airline: lean & mean status/tabline for vim that's light as air.  """"""
"" https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'
let g:airline_theme             = 'powerlineish'
"let g:airline_theme             = 'jellybeans'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
"" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"" vim-colorschemes: one colorscheme pack to rule them all! """"""""""""""""""
"" https://github.com/flazz/vim-colorschemes
Plugin 'flazz/vim-colorschemes'

"" numbers.vim: better line numbers for vim.
"" http://myusuf3.github.io/numbers.vim/
"Plugin 'myusuf3/numbers.vim'
"let g:enable_numbers = 0
"nnoremap <F6> :NumbersToggle<CR>
"nnoremap <F7> :NumbersOnOff<CR>

"" vim-polyglot: A collection of language packs for Vim.
" https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'

"" vim-css3-syntax: Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
"" https://github.com/hail2u/vim-css3-syntax
Plugin 'hail2u/vim-css3-syntax'

"" ultisnips: The ultimate snippet solution for Vim.
"" https://github.com/SirVer/ultisnips
"Plugin 'SirVer/ultisnips'

"" vim-snippets: This repository contains snippets files for various programming languages.
"" https://github.com/honza/vim-snippets
"Plugin 'honza/vim-snippets'

"" HTML-AutoCloseTag: Automatically closes HTML tags once you finish typing them.
"" http://www.vim.org/scripts/script.php?script_id=2591
"Plugin 'vim-scripts/HTML-AutoCloseTag'
" doesnt really work.... look for replacement








"" tern_for_vim autocompletes javascript
"Plugin 'marijnh/tern_for_vim'

"" vim-json: Syntax highlighting for JSON in Vim """""""""""""""""""""""""""""
"" https://github.com/leshill/vim-json
Plugin 'leshill/vim-json'
" (no config}

"" vim-javascript: Vastly improved Javascript indentation and syntax support
"" in Vim.
"" https://github.com/pangloss/vim-javascript
"Plugin 'pangloss/vim-javascript'
"let javascript_enable_domhtmlcss=1

"" indent/html.vim : alternative html indent script
"" http://www.vim.org/scripts/script.php?script_id=2075
Plugin 'indenthtml.vim'

"" vim-markdown: Vim Markdown runtime files
"" https://github.com/tpope/vim-markdown
Plugin 'tpope/vim-markdown'

"" Syntastic : Automatic syntax checking
"" http://www.vim.org/scripts/script.php?script_id=2736
Plugin 'Syntastic'
let g:syntastic_javascript_checkers = ['jsxhint']

"" surround.vim : Delete/change/add parentheses/quotes/XML-tags/much more with
"" ease
"" http://www.vim.org/scripts/script.php?script_id=1697
Plugin 'surround.vim'

"" Command-T : Fast file navigation for VIM
"" http://www.vim.org/scripts/script.php?script_id=3025
"Plugin 'Command-T'

"" ack.vim: Vim plugin for the Perl module / CLI script 'ack' """"""""""""""""
"" https://github.com/mileszs/ack.vim
"" USAGE: :Ack
Plugin 'ack.vim'
let g:ackprg = "/usr/bin/ack-grep -H --nocolor --nogroup --column"

"" xmledit: A filetype plugin to help edit XML, HTML, and SGML documents
"" http://www.vim.org/scripts/script.php?script_id=301
"Plugin 'xmledit'

"" CloseTag: functions and mappings to close open HTML/XML tags
"" http://www.vim.org/scripts/script.php?script_id=13
"Plugin 'closetag.vim'
"autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
"autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako so ~/.vim/bundle/closetag.vim/plugin/closetag.vim

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set history=1000
set undolevels=1000

" Backup
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowritebackup
set nobackup
set noswapfile
" set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

" Match and search
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch          " highlight search
set ignorecase        " Do case in sensitive matching with
set smartcase         " be sensitive when there's a capital letter
set incsearch         " Search as you type

" Visual
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number            " Show line numbers
set showmatch         " Show matching brackets.
set matchtime=5       " Bracket blinking.
set novisualbell      " No blinking
set noerrorbells      " No noise.
set laststatus=2      " Always show status line.
set vb t_vb=          " disable any beeps or flashes on error
set ruler             " Show ruler
set showcmd           " Display an incomplete command in the lower right corner
set autoread          " Automatically read a file that has changed on disk
set list              " Display unprintable characters f12 - switches
set listchars=tab:·\-,trail:·,extends:»,precedes:« " Unprintable chars mapping
set scrolloff=999
set backspace=indent,eol,start " Let backspace cross lines

" Text Formatting
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent

set tabstop=4         "
set softtabstop=4     "
set shiftwidth=4      " Width of '<' '>' indentation
set expandtab         " Insert spaces when <TAB>ing

set nosmarttab

" Keybindings
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ; :
" leader is a key that allows you to have your own "namespace" of keybindings.
let mapleader = ","
" map space bar to leader
map <space> <leader>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:redraw<CR>:echo $MYVIMRC 'reloaded'<CR>

set pastetoggle=<F5>

" clear the highlighting of :set hlsearch.
nnoremap <leader>n :nohls<CR>

" map 'jj' to <esc>
imap jj <esc>
cmap jj <esc>

" make regexp search use the more familiar regex syntax
"nnoremap / /\v
"nnoremap / /\v

" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" call :sudow FLIENAME when bit by a file you don't own
cnoremap sudow w !sudo tee % >/dev/null

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

set t_Co=256          " Use 256 colors
set background=dark
colo busybee

" invisible char colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

syntax on       " enable syntax highlighting


