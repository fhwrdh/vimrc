"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" fhwrdh | vimrc
"" URL: http://www.github.com/fhwrdh/vimrc
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set hidden
set history=1000
set undolevels=1000
set ttyfast                             " Better redraw for large files?
set encoding=utf8
set textwidth=120
" set colorcolumn=+1                    " show vertical line at 'textwidth' column

set autowriteall                        " save all files when switching buffers
:au FocusLost * :wa                     " save all files with losing focus
set mouse=a

"" [ Backup ]
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set directory=~/.vim/tmp/               " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
set nowritebackup                       " no backups on write
set nobackup                            " no backups at all
set noswapfile                          " no swap files
if exists("&undodir")
    set undofile                        " Persistent undo!
    let &undodir=&directory
    set undolevels=500
    set undoreload=500
endif
if !has('nvim')
    set viminfo+=n$HOME/.vim/tmp/viminfo
endif

"" [ Match and search ]
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                            " highlight search
set ignorecase                          " Do case in sensitive matching with
set smartcase                           " be sensitive when there's a capital letter
set incsearch                           " Search as you type

"" [ Visual ]
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                              " Show line numbers
set showmatch                           " Show matching brackets.
set matchtime=5                         " Bracket blinking.
" set novisualbell                        " No blinking
" set noerrorbells                        " No noise.
set laststatus=2                        " Always show status line.
" set vb t_vb=                            " disable any beeps or flashes on error
set ruler                               " Show ruler
set noshowmode                          " Don't show the mode since Powerline shows it
set showcmd                             " Display an incomplete command in the lower right corner
set autoread                            " Automatically read a file that has changed on disk
set list                                " Display unprintable characters f12 - switches
set listchars=tab:·\-,trail:·,extends:»,precedes:«          " Unprintable chars mapping
set scrolloff=20          " keep the cursor in the middle of the screen
set backspace=indent,eol,start          " Let backspace cross linest
set splitbelow                          " default split locations
set splitright
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildmode=longest,list,full
set wildmenu
set cursorline
" set colorcolumn=100,120               " highlight column 79 as a soft reminder
" set cursorcolumn

"" [ Text Formatting ]
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4                        " Width of '<' '>' indentation
set expandtab                           " Insert spaces when <TAB>ing
set nosmarttab

"" [ Keybindings ]
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" map semi to colon. saves the shift
" nnoremap ; :
" noremap <M-;> ;
map q: :q

"" map escape key to jj
imap jj <esc>
cmap jj <esc>

"" begin/end of lines
noremap H ^
noremap L $

"" Remap 0 to first non-blank character
map 0 ^

" No man pages because I don't write C or many shell scripts
noremap K <nop>

"" don't clobber the unnamed register on paste
"" https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
xnoremap p "_dP

"" map ',' and spacebar to leader.
let mapleader = " "
map <space> <Leader>

"" fast saving a buffer
nmap <Leader>w :wa!<cr>

nmap <Leader>u :r ! uuidgen<cr>

"" map backspace to last buffer
" nnoremap <bs> <c-^>
"" go to most recent buffer
nmap <Leader>e :e#<CR>

"" format file without losing position
nnoremap g= mmgg=G`m

"" insert newline in normal mode
nnoremap <CR> :<c-u>put =repeat(nr2char(10), v:count1)<cr>

"" call :sudow FILENAME to write a file you don't own
cnoremap sudow w !sudo tee % >/dev/null

"" search/replace with selection
xnoremap gr y:%s/<C-r>"//g<Left><Left>

"" clear the highlighting of :set hlsearch.
nnoremap <Leader>/ :nohls<CR>

"" Quickly edit/reload the vimrc file
nnoremap <silent> <Leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>:redraw<CR>:echo $MYVIMRC 'reloaded'<CR>
" reload on save
" autocmd BufWritePost .vimrc source $MYVIMRC

"" remove trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"" remove the ^M from wonky windows encodings
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"" open splits
nnoremap <Leader>vs :sp<CR>
nnoremap <Leader>vv :vsp<CR>

"" toggle relative/absolute line numbers
" nnoremap <silent><Leader>n :set rnu! rnu? <cr>

"" Switch CWD to the directory of the open buffer
map <Leader>cd :cd %:p:h<cr>:pwd<cr>

"" SPELLING
"" toggle spell checking
map <Leader>ss :setlocal spell!<cr>
"" spelling: next
map <Leader>sn ]s
"" spelling: prev
map <Leader>sp [s
"" spelling: add word
map <Leader>sa zg
"" spelling: suggest word
map <Leader>s? z=

"" buffer mgmt: next/prev/delete/closeall
" nnoremap <Leader>bp :bp<CR>
" nnoremap <Leader>bn :bn<CR>
" nnoremap <Leader>bd :bd<CR>

"" navigate splits with C-direction
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" nnoremap <Leader>gq gggqG<C-o><C-o>

"" Visual mode pressing * or # searches for the current selection
"" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"" Move visual blocks
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

"" copy / paste to the system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"" toggle paste mode
nnoremap <silent> <F5> :setlocal paste!<CR>

"" quickly select the text just pasted
noremap gV `[v`]

"" google search of selection
xnoremap <F1> "zy:!open "http://www.google.com/search?q=<c-r>=substitute(@z,' ','%20','g')<cr>"<return>gv

"" split line - opposite of J
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>

" Zoom
function! s:zoom()
  if winnr('$') > 1
    tab split
  elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                  \ 'index(v:val, '.bufnr('').') >= 0')) > 1
    tabclose
  endif
endfunction
nnoremap <silent> <Leader>z :call <sid>zoom()<cr>

"" insert current date
"" map F4 to insert current date
nnoremap <F4> "=strftime("%Y-%m-%d")<CR>
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>

"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" plug.vim | https://github.com/junegunn/vim-plug
"" To install new plugin:
"" 1. add entry to this file
"" 2. reload .vimrc  / <Leader>-s-v
"" 3. :PlugInstall
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"""" Env
Plug 'wincent/terminus'
Plug 'godlygeek/tabular'
vnoremap <silent> <Leader>tt :Tab /\|<CR>

"""" UI
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

let g:lightline = {}
let g:lightline.colorscheme = 'wombat'
let g:lightline.component_function = {
      \   'gitbranch': 'fugitive#head',
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }
let g:lightline.active = {
      \   'left': [ [ 'mode', 'paste' ], ['gitbranch'], ['filename', 'modified'], ['currentfunction']],
      \   'right': [['lineinfo'],['percent'], ['readonly' ], ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok']] }

"""" Files
Plug 'scrooloose/nerdtree'
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" The NERD tree : A tree explorer plugin for navigating the filesystem.
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache_    _']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
" let g:NERDTreeDirArrows=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30
"" This closes vim if the only window open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ini',    'yellow',  'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red',     'none', 'red', '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')

"" this opens nerdtree pointing to the location of the file in the current
"" buffer
" nnoremap <silent> <F2> :NERDTreeFind<CR>
" noremap <F3> :NERDTreeToggle<CR>
nnoremap <Leader>nf  :NERDTreeFind<CR>
nnoremap <Leader>nn  :NERDTreeToggle<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"" fzf.vim """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

let g:fzf_command_prefix = 'FZF'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Files with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* FindRg
  \ call fzf#vim#grep(
  \   'rg --smart-case --column --line-number --no-heading --color=always --colors=match:style:bold --colors=path:fg:green --colors=line:fg:yellow --glob=!*.lock --glob=!tags.temp --glob=!package-lock.json '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" find word under cursor
command! -bang -nargs=* FindRgCWord
  \ call fzf#vim#grep(
  \   'rg --smart-case --column --line-number --no-heading --color=always --colors=match:style:bold --colors=path:fg:green --colors=line:fg:yellow --glob=!*.lock --glob=!tags.temp --glob=!package-lock.json '.shellescape(expand('<cword>')), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <Leader>fa  :FindRg<Space>
nnoremap <Leader>fr  :FindRg<Space>
nnoremap <Leader>fn  :FindRgCWord<CR>

nnoremap <Leader>fb  :FZFBuffers<CR>
nnoremap <Leader>fc  :FZFCommits<CR>
nnoremap <Leader>fcb :FZFBCommits<CR>
" https://github.com/junegunn/fzf.vim/issues/364
nnoremap <Leader>ff  :Files<CR>
nnoremap <Leader>fff :call fzf#vim#files('.', {'options':'--query '.expand('<cword>')})<CR>
nnoremap <Leader>fg  :FZFGFiles? --exclude-standard --cached --others<CR>
nnoremap <Leader>fgg :FZFGFiles<CR>
nnoremap <Leader>fl  :FZFLines<CR>
nnoremap <Leader>fh  :FZFHistory<CR>
nnoremap <Leader>fm  :FZFMru<CR>
nnoremap <Leader>fs  :FZFSnippets<CR>
nnoremap <Leader>fw  :FZFWindows<CR>

" insert mode only
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --exclude=node_modules --exclude=.git'

"""" Completion
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" autocmd FileType json syntax match Comment +\/\/.\+$+
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" imap <C-l> <Plug>(coc-snippets-expand)
" nnoremap <silent> <space>cy :<C-u>CocList -A --normal yank<cr>

" " " remap keys for gotos
" nmap <silent> cgd <Plug>(coc-definition)
" nmap <silent> cgy <Plug>(coc-type-definition)
" nmap <silent> cgi <Plug>(coc-implementation)
" nmap <silent> cgr <Plug>(coc-references)

" " " use <c-space>for trigger completion
" " " inoremap <silent><expr> <c-space> coc#refresh()

" function! s:show_documentation()
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" " Show all diagnostics for the file
" nnoremap <silent> <space>cd :<C-u>CocList diagnostics<cr>
" " Do default action for next item.
" nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>
" " yank list
" nnoremap <silent> <space>cy  :<C-u>CocList -A --normal yank<cr>
""""""""""  /coc

"""" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<C-l>"

Plug 'honza/vim-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

"""" Search / Motion
"" Ferret provides an :Ack command for searching across multiple files
" Plug 'wincent/ferret'
"" try: ,,w

Plug 'easymotion/vim-easymotion'
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


"""" Git
Plug 'airblade/vim-gitgutter'
"" vim-gitgutter: A Vim plugin which shows a git diff in the gutter """"""""""""
"" (sign column) and stages/reverts hunks.
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '·'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~'
"" Doesn't map any keys by default
let g:gitgutter_map_keys = 0
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nnoremap <silent><Leader>gn :GitGutterNextHunk<CR>
nnoremap <silent><Leader>gp :GitGutterPrevHunk<CR>
nnoremap <silent><Leader>gu :GitGutterUndoHunk<CR>
nnoremap <silent><Leader>gv :GitGutterPreviewHunk<CR>

Plug 'tpope/vim-fugitive'
"" fugitive.vim """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gd :Gdiff<CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>

Plug 'gregsexton/gitv', {'on': ['Gitv']}

"""" Code
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
"" EditorConfig Vim Plugin """""""""""""""""""""""""""""""""""""""""""""""""""
"" To ensure that this plugin works well with Tim Pope's fugitive,
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let g:EditorConfig_max_line_indicator = "fill"
let g:EditorConfig_verbose = 0

" if  executable('ctags')
"   Plug 'ludovicchabant/vim-gutentags'
" endif

Plug 'dense-analysis/ale'
let g:ale_completion_enabled = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
" let g:ale_echo_msg_error_str = 'Error'
" let g:ale_echo_msg_warning_str = 'Warn'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <Leader>an :ALENextWrap<cr>
nmap <silent> <Leader>ap :ALEPreviousWrap<cr>

Plug 'sheerun/vim-polyglot'
"" vim-polyglot: A collection of language packs for Vim. """""""""""""""""""""""
"" INCLUDED IN VIM-POLYGLOT "Plugin 'pangloss/vim-javascript'
"" to disable individual language packs:
" let g:polyglot_disabled = ['css']
let javascript_enable_domhtmlcss=1
" let g:javascript_conceal_function       = "ƒ"
" let g:javascript_conceal_null           = "ø"
" let g:javascript_conceal_this           = "@"
" let g:javascript_conceal_return         = "⇚"
" let g:javascript_conceal_undefined      = "¿"
" let g:javascript_conceal_NaN            = "ℕ"
" let g:javascript_conceal_prototype      = "¶"
" let g:javascript_conceal_static         = "•"
" let g:javascript_conceal_super          = "Ω"
" let g:javascript_conceal_arrow_function = "⇒"

Plug 'hail2u/vim-css3-syntax'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"" vim-prettier """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>pp :Prettier<CR>
map <Leader>pa :PrettierAsync<CR>
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
let g:prettier#quickfix_enabled = 0
" let g:prettier#exec_cmd_async = 1

"Then type <c-y>, (Ctrly,)
Plug 'mattn/emmet-vim'

""" JavaScript
"" Prefer local repo install of eslint over global install with syntastic
" Plug 'mtscout6/syntastic-local-eslint.vim'
" Plug 'othree/yajs.vim'
" Plug 'HerringtonDarkholme/yats.vim'
"""" React
Plug 'mvolkmann/vim-react'
Plug 'mxw/vim-jsx'
"" vim-jsx: React JSX syntax highlighting and indenting for vim. """""""""""""""
"" This bundle requires pangloss's vim-javascript syntax highlighting.
"" By default, JSX syntax highlighting and indenting will be enabled only for
"" files with the .jsx extension. If you would like JSX in .js files, add:
let g:jsx_ext_required = 0

Plug 'samuelsimoes/vim-jsx-utils'
"" https://github.com/samuelsimoes/vim-jsx-utils """"""""""""""""""""""""""""""""
"" Plugin with some utilities (like extract partial render) to folks who work with JSX on Vim.
nnoremap <Leader>je :call JSXExtractPartialPrompt()<CR>
nnoremap <Leader>ji :call JSXEachAttributeInLine()<CR>
nnoremap <Leader>jr :call JSXEncloseReturn()<CR>
nnoremap <Leader>jt :call JSXChangeTagPrompt()<CR>
nnoremap vat :call JSXSelectTag()<CR>

Plug 'styled-components/vim-styled-components', {'branch': 'main'}
"""" Markdown
Plug 'tpope/vim-markdown'
Plug 'shime/vim-livedown'
"" livedown: """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" requires livedown app: npm install -g livedown
"" ./livedown start <file> --open
nmap <Leader>md :LivedownToggle<CR>

"""" Utils
Plug 'guns/xterm-color-table.vim'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
"" vim-sayonara """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Quickly close the current window
nnoremap <Leader>q :Sayonara<CR>
"" Quickly close the current buffer without quiting
nnoremap <Leader>Q :Sayonara!<CR>

Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
"" sjl/gundo.vim """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent noremap <Leader>gut :GundoToggle<CR>

Plug 'terryma/vim-expand-region'
"" terryma/vim-expand-region """""""""""""""""""""""""""""""""""""""""""""""""""
"" expand region. S-v to kill. Ctrl-v to shrink.
vmap v <Plug>(expand_region_expand)
vmap <S-v> <Plug>(expand_region_shrink)

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'unblevable/quick-scope'
"" https://github.com/unblevable/quick-scope """""""""""""""""""""""""""""""""""
"" Only enable the quick-scope plugin's highlighting when using the f/F/t/T movements
function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction
let g:qs_enable = 0

nnoremap <expr> <silent> f Quick_scope_selective('f')
nnoremap <expr> <silent> F Quick_scope_selective('F')
nnoremap <expr> <silent> t Quick_scope_selective('t')
nnoremap <expr> <silent> T Quick_scope_selective('T')
vnoremap <expr> <silent> f Quick_scope_selective('f')
vnoremap <expr> <silent> F Quick_scope_selective('F')
vnoremap <expr> <silent> t Quick_scope_selective('t')
vnoremap <expr> <silent> T Quick_scope_selective('T')

Plug 'wellle/targets.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-highlightedyank'

"" FUTURES LIST //////////////////////////////////////

Plug 'ruanyl/coverage.vim'
let g:coverage_json_report_path = 'coverage/coverage-final.json'
let g:coverage_sign_covered = '⦿'
let g:coverage_interval = 5000
let g:coverage_show_covered = 0
let g:coverage_show_uncovered = 1

Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

Plug 'itchyny/vim-cursorword'

Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'

Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
let g:Hexokinase_ftAutoload = ['css', 'js']

Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'felixhummel/setcolors.vim'

Plug 'jparise/vim-graphql'

Plug 'chr4/nginx.vim'

call plug#end()
"" /////////////////////////////////////////////////////////////////

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Functions
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Make a scratch buffer with all of the leader keybindings.
"" Adapted from http://ctoomey.com/posts/an-incremental-approach-to-vim/
"" ---------------------------------------------------------
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
nnoremap <Leader>ll  :ListLeaders<CR>

"" ---------------------------------------------------------
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"" Colors
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" http://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
set t_Co=256          " Use 256 colors
set background=dark

"" GVIM
"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    " Remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set lines=999 columns=999
    autocmd GUIEnter * set vb t_vb=
    colorscheme wombat256
else
    colo fhwrdh
endif

"" enable syntax highlighting
syntax on
