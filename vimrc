"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" fhwrdh / vimrc
"" URL: http://www.github.com/fhwrdh/vimrc
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set history=1000
set undolevels=1000

"" Backup
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nowritebackup
set nobackup
set noswapfile
"" set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

"" Match and search
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch          " highlight search
set ignorecase        " Do case in sensitive matching with
set smartcase         " be sensitive when there's a capital letter
set incsearch         " Search as you type

"" Visual
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number            " Show line numbers
set showmatch         " Show matching brackets.
set matchtime=5       " Bracket blinking.
set novisualbell      " No blinking
set noerrorbells      " No noise.
set laststatus=2      " Always show status line.
set vb t_vb=          " disable any beeps or flashes on error
set ruler             " Show ruler
set noshowmode        " Don't show the mode since Powerline shows it
set showcmd           " Display an incomplete command in the lower right corner
set autoread          " Automatically read a file that has changed on disk
set list              " Display unprintable characters f12 - switches
set listchars=tab:·\-,trail:·,extends:»,precedes:« " Unprintable chars mapping
set scrolloff=999     " keep the cursor in the middle of the screen
set backspace=indent,eol,start " Let backspace cross lines
set splitbelow        " default split locations
set splitright

"" Text Formatting
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4         "
set softtabstop=4     "
set shiftwidth=4      " Width of '<' '>' indentation
set expandtab         " Insert spaces when <TAB>ing
set nosmarttab

"" Keybindings
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" map semi to colon. saves the shift
nnoremap ; :
imap jj <esc>
cmap jj <esc>

"" begin/end of lines
noremap H ^
noremap L $

"" Tabs
noremap <silent> <S-t> :tabnew<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT

"" windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" C-{n,p} move between buffers
noremap <silent> <C-p> :bp<CR
noremap <silent> <C-n> :bn<CR>

"" map ',' and spacebar to leader.
let mapleader = ","
map <space> <leader>

" fast saving a buffer
nmap <leader>w :w!<cr>

" clear the highlighting of :set hlsearch.
nnoremap <leader>/ :nohls<CR>

"" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :source $MYVIMRC<CR>:redraw<CR>:echo $MYVIMRC 'reloaded'<CR>

"" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" call :sudow FILENAME when bit by a file you don't own
cnoremap sudow w !sudo tee % >/dev/null

"" remove the ^M from wonky windows encodings
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

map <leader>pp :setlocal paste!<cr>
nnoremap <silent> <F5> :setlocal paste!<CR>
"" toggle spell checking
map <leader>ss :setlocal spell!<cr>
"" buffer mgmt
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>

"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Brief help
"" :PluginInstall(!)    - install (update) bundles
"" :PluginSearch(!) foo - search (or refresh cache first) for foo
"" :PluginClean(!)      - confirm (or auto-approve) removal of unused bundles
"
"" see :h vundle for more details or wiki for FAQ
"" NOTE: comments after Plugin commands are not allowed.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Vundle.vim: Vundle, the plug-in manager for Vim """""""""""""""""""""""""""""
"" https://github.com/gmarik/Vundle.vim
Plugin 'gmarik/Vundle.vim'

"" eunuch.vim : Helpers for UNIX
"" http://www.vim.org/scripts/script.php?script_id=4300
Plugin 'tpope/vim-eunuch'

"" ack.vim: Vim plugin for the Perl module / CLI script 'ack' """"""""""""""""""
"" https://github.com/mileszs/ack.vim
"" USAGE: :Ack
Plugin 'ack.vim'
"" let g:ackprg = "/usr/bin/ack-grep -H --nocolor --nogroup --column"
let g:ackprg = "ag --nocolor --nogroup --column"

"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" The NERD tree : A tree explorer plugin for navigating the filesystem.
Plugin 'scrooloose/nerdtree'
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache_    _']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
"" this opens nerdtree pointing to the location of the file in the current
"" buffer
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

"" vim-commentary: comment stuff out
"" https://github.com/tpope/vim-commentary
Plugin 'tpope/vim-commentary'

"" fugitive.vim: a Git wrapper so awesome, it should be illegal
"" http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'tpope/vim-fugitive'

"" vim-gitgutter: A Vim plugin which shows a git diff in the gutter """"""""""""
"" (sign column) and stages/reverts hunks.
"" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '~~'
let g:gitgutter_sign_removed = '--'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'

"" 'You don't have to do anything: it just works.'
"" gitv: gitk for Vim.
"" https://github.com/gregsexton/gitv
Plugin 'gitv'

"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-airline: lean & mean status/tabline for vim that's light as air.
"" https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'
"let g:airline_theme             = 'powerlineish'
let g:airline_theme             = 'fhwrdh'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif
  let g:airline_symbols.space = "\ua0"
"" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

"" tmuxline.vim: Simple tmux statusline generator with support for powerline
"" symbols and statusline / airline / lightline integration
"" https://github.com/edkolev/tmuline.vim
Plugin 'edkolev/tmuxline.vim'
let g:tmuxline_preset = 'nightly_fox'

"" vim-colorschemes: one colorscheme pack to rule them all!  """""""""""""""""""
"" https://github.com/flazz/vim-colorschemes
Plugin 'flazz/vim-colorschemes'


"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Unite: Unite and create user interfaces
"" https://github.com/Shougo/unite.vim
Plugin 'Shougo/unite.vim'
"" https://github.com/Shougo/neomru.vim
Plugin 'Shougo/neomru.vim'
"" unite-outline
"" https://github.com/shougo/unite-outline
Plugin 'Shougo/unite-outline'
"'" vimproc.vim :
"" requires building lib
Plugin 'Shougo/vimproc.vim'
"" Unite plugin for quickfix buffer
Plugin 'osyo-manga/unite-quickfix'

Plugin 'ujihisa/unite-colorscheme'

Plugin 'rking/ag.vim'

let g:unite_source_file_mru_limit = 200
let g:unite_source_history_yank_enable = 1
let g:unite_prompt='» '
let g:unite_abbr_highlight = 'Keyword'
let g:unite_split_rule = "botright"
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
          \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
          \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' ' .
          \ '--ignore ''**/*.pyc'''
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
    let g:unite_source_grep_command = 'ack-grep'
    " Match whole word only. This might/might not be a good idea
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -H'
    "let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
    let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
    let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_grep_search_word_highlight = 1
endif

" b: buffer
map <leader>ub :Unite -quick-match buffer<CR>
" c: colorscheme
map <leader>uc :Unite colorscheme -auto-preview<CR>
" f: file
map <leader>uf :Unite -toggle -start-insert file_rec/async<CR>
" g: grep
map <leader>ug :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite quickfix -no-quit -auto-preview<CR>
" *: grep at cursor
map <leader>u* :exe 'silent Ggrep -i '.expand("<cword>")<Bar>Unite quickfix -no-quit<CR>
" h: history
map <leader>uh :Unite -toggle history/yank<CR>
" o: outline
nnoremap <silent><Leader>uo :Unite -silent -vertical -winwidth=40 -direction=topleft -toggle outline<CR>
" p: process
map <leader>up :Unite -toggle -start-insert process<CR>
" q: quickfix
map <leader>uq :Unite -toggle quickfix<CR>
" r: recent (mru)
map <leader>ur :Unite -toggle -start-insert file_mru<CR>
" t: tab
map <leader>ut :Unite -toggle -quick-match tab<CR>
" x: command
map <leader>ux :Unite command<CR>

"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" neocomplete: Next generation completion framework after neocomplcache
"" https://github.com/Shougo/neocomplete.vim
Plugin 'Shougo/neocomplete'
"" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

"" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
"" <CR> closes popup
inoremap <expr><CR> pumvisible() ? neocomplete#smart_close_popup() : "\<CR>"
"" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><space> pumvisible() ? neocomplete#smart_close_popup()."\<space>" : "\<space>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

"" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" neosnippet: neo-snippet plugin contains neocomplcache snippets source
"" https://github.com/Shougo/neosnippet.vim
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
"let g:neosnippet#snippets_directory='~/path/to/above/snippets/'

"" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

"" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

"" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"" vim-polyglot: A collection of language packs for Vim. """""""""""""""""""""""
"" https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'

"" vim-javascript: Vastly improved Javascript indentation and syntax support
"" in Vim.
"" https://github.com/pangloss/vim-javascript
"" INCLUDED IN VIM-POLYGLOT "Plugin 'pangloss/vim-javascript'
let javascript_enable_domhtmlcss=1

"" vim-jsx: React JSX syntax highlighting and indenting for vim. """""""""""""""
"" https://github.com/mxw/vim-jsx
"" This bundle requires pangloss's vim-javascript syntax highlighting.
Plugin 'mxw/vim-jsx'
"" By default, JSX syntax highlighting and indenting will be enabled only for
"" files with the .jsx extension. If you would like JSX in .js files, add:
let g:jsx_ext_required = 0

"" vim-css3-syntax: Add CSS3 syntax support to vim's built-in `syntax/css.vim`
"" https://github.com/hail2u/vim-css3-syntax
Plugin 'hail2u/vim-css3-syntax'

"" vim-json: Syntax highlighting for JSON in Vim """""""""""""""""""""""""""""""
"" https://github.com/leshill/vim-json
Plugin 'leshill/vim-json'
"" (no config}

"" HTML-AutoCloseTag: Automatically closes HTML tags once you finish typing
"" them.
"" http://www.vim.org/scripts/script.php?script_id=2591
"Plugin 'vim-scripts/HTML-AutoCloseTag'
"" doesnt really work.... look for replacement

"" indent/html.vim : alternative html indent script """"""""""""""""""""""""""""
"" http://www.vim.org/scripts/script.php?script_id=2075
Plugin 'indenthtml.vim'

"" vim-markdown: Vim Markdown runtime files """"""""""""""""""""""""""""""""""""
"" https://github.com/tpope/vim-markdown
Plugin 'tpope/vim-markdown'

"" Syntastic : Automatic syntax checking """""""""""""""""""""""""""""""""""""""
"" http://www.vim.org/scripts/script.php?script_id=2736
Plugin 'Syntastic'
let g:syntastic_javascript_checkers = ['jsxhint']

"" surround.vim : Delete/change/add parentheses/quotes/XML-tags/much """""""""""
"" more with ease
"" http://www.vim.org/scripts/script.php?script_id=1697
Plugin 'surround.vim'
"" Examples : cs"' --> converts from double to single quotes

Plugin 'tpope/vim-ragtag'
let g:ragtag_global_maps = 1

"" livedown: Live Markdown previews for your favourite editor.""""""""""""""""""
"" https://github.com/shime/livedown
"" requires livedown app: npm install -g livedown
"" ./livedown start <file> --open
Plugin 'shime/livedown'
"" this does not seem to work?
"map gm :call LivedownPreview()<CR>

"" vim-expand-region """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" https://github.com/terryma/vim-expand-region
"" '+'/'-' to expand/contract
Plugin 'terryma/vim-expand-region'

"" ZoomWin: Zoom in/out of windows """""""""""""""""""""""""""""""""""""""""""""
"" https://github.com/vim-scripts/ZoomWin
"" Press <c-w>o : the current window zooms into a full screen
"" Press <c-w>o again: the previous set of windows is restored
Plugin 'vim-scripts/ZoomWin'

"" tern_for_vim: Tern plugin for vim """""""""""""""""""""""""""""""""""""""""""
"" https://github.com/marijnh/tern_for_vim
"" Install the tern server by running npm install in the bundle/tern_for_vim
"" directory.
Plugin 'marijnh/tern_for_vim'
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

"" FUTURES LIST
" 'tpope/unimpaired'
" https://github.com/maksimr/vim-jsbeautify



call vundle#end()
filetype plugin indent on

"" Functions
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Make a scratch buffer with all of the leader keybindings.
"" Adapted from http://ctoomey.com/posts/an-incremental-approach-to-vim/
function! ListLeaders()
  silent! redir @b
  silent! nmap <LEADER>
  silent! redir END
  silent! new
  silent! set buftype=nofile
  silent! set bufhidden=hide
  silent! setlocal noswapfile
  silent! put! b
  silent! g/^s*$/d
  silent! %s/^.*,//
  silent! normal ggVg
  silent! sort
  silent! let lines = getline(1,"$")
  silent! normal <esc>
endfunction
command! ListLeaders :call ListLeaders()

"" Colors
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
set t_Co=256          " Use 256 colors
set background=dark
"colo 256-grayvim
"colo busybee
"colo darkburn
"colo ir_black
"colo mustang
"colo up
"colo xoria256
colo fhwrdh


" "" invisible char colors
" highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4a59

" "" highlight the line number of the current line?
" highlight CursorLine   ctermfg=141
" highlight CursorLineNr ctermfg=222 cterm=bold

" if exists('+colorcolumn')
" "  set colorcolumn=80,120 " Color the 80th column differently as a wrapping guide.
" endif

"" enable syntax highlighting
syntax on




