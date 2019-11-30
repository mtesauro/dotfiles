"*****************************************************************************
"" Matt Tesauro's nvim configuration
"*****************************************************************************"

"" NOTE: Assumes Neovim version 0.3.8 or later.

"*****************************************************************************
"" Setup vim-plug - https://github.com/junegunn/vim-plug
"*****************************************************************************"

"" Used for vim-plug conditional below
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')


"" Install vim-plug
if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"*****************************************************************************
"" Install plugins - Start
"*****************************************************************************"

" Required to tell vim-plug to install these
call plug#begin(expand('~/.config/nvim/plugged'))

"" Add deoplete for auto-completion
"" https://github.com/Shougo/deoplete.nvim
"" Expects https://github.com/stamblerre/gocode to be installed
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "" https://github.com/deoplete-plugins/deoplete-go
  Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

"" Add vim-workspace plugin
"" https://github.com/thaerkh/vim-workspace
Plug 'thaerkh/vim-workspace'

"" Add nerdtree plugin
"" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
"" Add nerdtree-tabs plugin
"" https://github.com/jistr/vim-nerdtree-tabs
Plug 'jistr/vim-nerdtree-tabs'

"" Add Commentary plugin
"" https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'

"" Add vim-airline pluign
"" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
"" And the vim-airline themes
"" https://github.com/vim-airline/vim-airline-themes
Plug 'vim-airline/vim-airline-themes'

"" Add vim-syntastic plugin - used by vim-airline
"" https://github.com/vim-syntastic/syntastic
"" External programs to check syntax at listed at:
"" https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt
Plug 'vim-syntastic/syntastic'

"" Add tagbar plugin
"" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'

"" Add vim-gitgutter plugin
"" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'

"" Add grep.vim plugin
"" https://github.com/vim-scripts/grep.vim
Plug 'vim-scripts/grep.vim'

"" Add vim-trailing-whitespace plugin
"" https://github.com/bronson/vim-trailing-whitespace
"" If this one doesn't cut it, there's always
"" https://github.com/ntpeters/vim-better-whitespace
Plug 'bronson/vim-trailing-whitespace'

"" Add delimitMate plugin
"" https://github.com/Raimondi/delimitMate
Plug 'Raimondi/delimitMate'

"" Add IndentLine plugin
"" https://github.com/Yggdroot/indentLine
Plug 'Yggdroot/indentLine'

"" Add vim-ployglot plugin
"" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

"" Add fzf plugin
"" https://github.com/junegunn/fzf#as-vim-plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"" Add snippets via Ultisnips
"" https://github.com/SirVer/ultisnips
Plug 'SirVer/ultisnips'

"" Add vim-snipmate default snippets
"" https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

"" Add fatih's forked version of molokai theme
"" https://github.com/fatih/molokai
"" Forked from https://github.com/tomasr/molokai
Plug 'fatih/molokai'

"*****************************************************************************
"" Language specific plugin bundles
"*****************************************************************************

"" ***********************
"" Golang Language Plugins
"" ***********************
"" Add vim-go plugin
"" https://github.com/fatih/vim-go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
"" Add splitjoin.vim plugin
"" https://github.com/AndrewRadev/splitjoin.vim
Plug 'AndrewRadev/splitjoin.vim'
"" Add ctrlp.vim plugin
"" https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

"" *********************
"" HTML Language Plugins
"" *********************
"" Add vim-css3-syntax plugin
"" https://github.com/hail2u/vim-css3-syntax
Plug 'hail2u/vim-css3-syntax'
"" Add vim-coloresque plugin
"" https://github.com/gko/vim-coloresque
Plug 'gorodinskiy/vim-coloresque'
"" Add vim-haml plugin
"" https://github.com/tpope/vim-haml
Plug 'tpope/vim-haml'
"" Add emmet-vim plugin
"" https://github.com/mattn/emmet-vim
Plug 'mattn/emmet-vim'

"" ***************************
"" JavaScript Language Plugins
"" ***************************
"" Add vim-javascript-syntax plugin
"" https://github.com/jelera/vim-javascript-syntax
Plug 'jelera/vim-javascript-syntax'

"" ********************
"" PHP Language Plugins
"" ********************
"" Add vim-php-namespace plugin
"" https://github.com/arnaud-lb/vim-php-namespace
Plug 'arnaud-lb/vim-php-namespace'

"" ***********************
"" Python Language Plugins
"" ***********************
"" Add jedi-vim plugin
"" https://github.com/davidhalter/jedi-vim
Plug 'davidhalter/jedi-vim'
"" Add requirements.txt.vim plugin
"" https://github.com/raimon49/requirements.txt.vim
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" Initialize plugin system
call plug#end()
"*****************************************************************************
"" Install plugins - End
"*****************************************************************************

" Required by vim-go
filetype plugin indent on

"*****************************************************************************
"" Matt's customizations
"*****************************************************************************"

"" Setup nicer colors - :help termguicolors
set termguicolors
"" Setup relative numbers - :help relativenumber
set relativenumber
"" Set it so current line number is zero for relativenumber - :help number
set number
"" Have y and p use the 'global' buffer so copy/paste outside of neovim 'just works'
"" :help clipboard
set clipboard+=unnamedplus
"" Turn off line wrapping :help nowrap
set nowrap
"" Set the colorscheme and some options for the fatih/molokai theme
"" :help colorscheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
"" Encoding settings
"" :help encoding & :help fileencoding & :help fileencodings
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
"" :help bomb & :help binary
set bomb
set binary
"" Fix backspace per https://vim.fandom.com/wiki/Backspace_and_delete_problems
set backspace=indent,eol,start
"" Default tab settings, autocmd can override then
"" :help tabstop & :help softtabstop & :help shiftwidth & :help expandtab
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
"" Map leader key to , (comma) :help mapleader
let mapleader=","
"" Enable hidden buffers :help hidden
set hidden
"" Searching options
"" :help hlsearch & :help incsearch & :help ignorecase & :help smartcase
set hlsearch
set incsearch
set ignorecase
set smartcase
"" Directories for swp files - :help nobackup & :help noswapfile
set nobackup
set noswapfile
"" End of Line Format defaults - :help fileformats
set fileformats=unix,dos,mac
"" Set the shell for vim to use
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Visual settings
"*****************************************************************************"

"" :help syntax
syntax on
"" :help ruler
set ruler
"" Use modeline overrides - :help modeline & :help modelines
set modeline
set modelines=10
"" Set the title - :help title & :help titleold & :help titlestring
set title
set titleold="Terminal"
set titlestring=%F
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
"" Setup a leader key to start a terminal
nnoremap <silent> <leader>sh :terminal<CR>

" Disable visualbell - :help noerrorbells & :help visualbell & :help t_vb
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"set autoread
" Auto-load checking from https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" Leader key to show open buffers
nnoremap <silent> <leader>b :buffers<CR>

"" YY will yank/copy a visual section - :help y
noremap YY "+y<CR>

"" Leader p will paste before the current position, placing the cursor after the new text
"" :help gP
noremap <leader>p "+gP<CR>

"" XX will delete a visual selection - :help x
noremap XX "+x<CR>

"" Buffer handling shortcuts
"" Move to previous buffer - :help bp
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
"" Move to next buffer - :help bn
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>
"" Close current buffer - :help bd
noremap <leader>c :bd<CR>

"" Clean search (highlight) - :help noh
nnoremap <silent> <leader><space> :noh<cr>

"" Moving between open windows
"" map Control + direction key to move to the window in that direction
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Mappings for visual mode
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv
"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"*****************************************************************************
"" Plugin configurations
"*****************************************************************************"

"" NERDTree configuration
"" https://github.com/scrooloose/nerdtree/blob/master/doc/NERDTree.txt
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
"" Sort directories first, then .go files, then others...
let g:NERDTreeSortOrder=['\/$', '\.go$', '\.yml$', '\.md$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
"" Set how wide the tab/window for NERDTree opens in characters
let g:NERDTreeWinSize = 30
"" help: wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
"" Have F2 open NERDTree and F3 close it
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>

"" vim-airline configuration
"" https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
"" https://github.com/vim-airline/vim-airline-themes/blob/master/doc/airline-themes.txt
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"" vim-syntastic configuration
"" https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic.txt
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

"" Tagbar configuration
"" https://github.com/majutsushi/tagbar/blob/master/doc/tagbar.txt
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
"" Configure for languages: 
""      https://github.com/majutsushi/tagbar/wiki#support-for-additional-filetypes
"" Golang support for Tagbar
"" From: https://github.com/jstemmer/gotags/blob/master/README.md#vim-tagbar-configuration
let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"" grep.vim configuration
"" https://github.com/vim-scripts/grep.vim/blob/master/README
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" fzf.vim configurations
"" https://github.com/junegunn/fzf/blob/master/doc/fzf.txt
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
" have fzf use 'The Silver Searcher' if installed
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif
" have fzf use ripgrep aka 'rg' if installed
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif
"" leader e starts a fzf search
nnoremap <silent> <leader>e :FZF -m<CR>
"" control-P starts a search of the pwd
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" UltiSnips configurations
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

"*****************************************************************************
"" Language specific configurations
"*****************************************************************************

" Go Language configurations
" **************************
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go nmap <leader>dr :GoDeclsDir<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go imap <leader>dr <esc>:<C-u>GoDeclsDir<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

" vim-go tutorial suggestiosn
set autowrite
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" Leader shortcut for :GoBuild or :GoTest intelligently based on file name
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" :GoCoverageToggle from tutorial
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" Set shortcuts for splitjoin
autocmd FileType go nmap <Leader>j :SplitjoinJoin<cr>
autocmd FileType go nmap <Leader>s :SplitjoinSplit<cr>
"auto generated above by vim-bootstrap
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"If you ever need to increase :GoTest's timeout, uncomment the below
"let g:go_test_timeout = '10s'
let g:go_auto_type_info = 1
set updatetime=100
let g:go_auto_sameids = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
""let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave = 0
" If you want to only run certain linters on save, change the below:
""let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave_enabled = []
" let g:go_metalinter_deadline = "5s"

" HTML Language configurations
" ****************************
" for html files, tabs at 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" JavaScript Language configurations
" **********************************
let g:javascript_enable_domhtmlcss = 1
" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

" Python Language configurations
" ******************************
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END
" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" Create abbreviations to help with capitalization whoopses when writing/quiting
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

