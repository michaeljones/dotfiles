" Basic Preferences
set nocompatible		" don't worry about Vi compatibility

" Initialise Pathogen Setup
filetype off

" Recommended in :help netrw-ml_get to silence ml_get errors
let g:netrw_use_noswf= 0

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

if has("vms")
	set nobackup
else
	set backup
	set backupcopy=yes
	set backupdir=/tmp/vim_backups,/tmp
	set directory=/tmp/vim_swap,/tmp
endif

" Disable clang for the moment
let g:clang_complete_auto = 0

" Configure our map leader
let mapleader = ","
let maplocalleader = ","

" Always show the status line
set laststatus=2


" Show white space (tabs, trailing spaces and eof chars)
" From Vim Casts
set list
set listchars=tab:‣\ ,eol:¬,trail:·,precedes:.

" Colour settings
set background=dark
colorscheme desert
syntax on
filetype on

" Highlight column after textwidth
set colorcolumn=+1
hi ColorColumn ctermbg=darkgrey guibg=#444444

" Gvim Gui Options
set guioptions-=m
set guioptions-=T
set guioptions+=c

" Display line numbers
set number

" Tabbing settings
set autoindent
" set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set vb t_vb=

set grepprg=grep\ -IRn\ $*

" autocmd!

" Files specific tab settings
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

" SConstruct file is a Python file
autocmd BufNewFile,BufRead SConstruct,SConscript set ft=python
autocmd BufNewFile,BufRead *.scons set ft=python
autocmd BufNewFile,BufRead svn-commit.* setf svn
autocmd BufNewFile,BufRead *.mako set filetype=mako
autocmd BufNewFile,BufRead *.sl set filetype=sl
autocmd BufNewFile,BufRead *.lib set filetype=make
autocmd BufNewFile,BufRead *.pkg set filetype=xml
autocmd BufNewFile,BufRead *.hs set filetype=haskell
autocmd BufNewFile,BufRead *.log set nowrap
autocmd BufNewFile,BufRead *.do set filetype=sh
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost weekly setlocal expandtab
autocmd BufReadPost *.dojo setlocal expandtab ft=yaml
autocmd BufReadPost *.yaml setlocal expandtab
autocmd BufReadPost *.cabal setlocal expandtab
autocmd BufReadPost *.nix setlocal expandtab
autocmd BufReadPost *.hiveconfig setlocal filetype=json
autocmd BufReadPost *.hiveconfig setlocal shiftwidth=2
autocmd BufReadPost *.ts setlocal filetype=typescript

" autocmd GUIEnter * call Maximize_Window()
autocmd GUIEnter * call system('wmctrl -i -b add,maximized_vert,maximized_horz -r '.v:windowid)


augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

highlight Pmenu guibg=brown gui=bold

" Allow unix & dos line endings
set fileformats=unix,dos
set fileformats+=dos

set history=50			" remember 50 commands
set showcmd				" show currently typed sequence in the bottom right
set hidden				" allow modified buffers to be left in the background

filetype plugin indent on

set backspace=eol,start,indent
set incsearch			" searches as you type instead of waiting for <CR>
set hlsearch			" enables highlighting for search results

" XP Template Options
" -------------------
let g:xptemplate_snippet_folders=['~/.vim/xptemplate']

" MiniBufferExplorer Options
" --------------------------
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1 
" let g:miniBufExplVSplit = 20
" let g:miniBufExplorerDebugLevel = 10 
" let g:miniBufExplorerDebugMode = 2 


" Python Options
" --------------
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1


" KeyBoard mappings
" -----------------

" map j <left>
" map k <down>
" map l <up>
" map ; <right>

" map <c-i> <c-u>


" Buffer nav
map <F1> :TMiniBufExplorer<cr>
map <F2> :TlistToggle

" map <A-k> :bnext<CR>
" map <A-l> :bprevious<CR> 

map <C-j> :bnext<CR>
map <C-k> :bprevious<CR>

imap <C-j> <ESC>:bnext<CR>
imap <C-k> <ESC>:bprevious<CR>

map <c-del> <ESC>
imap <c-del> <ESC>


" Ctags
map <A-n> :cprevious<CR>
map <A-m> :cnext<CR>

" Save & Quits
" map <C-w> :bd<CR>
" map <C-S-w> :bd!<CR>

" map <C-q> :q!<CR>:q!<CR>
" vmap <C-q> <ESC>:q!<CR>:q!<CR>
" imap <C-q> <ESC>:q!<CR>:q!<CR>
" map <C-s> :w<CR>

" imap <C-s> <esc><C-s>

" Insert new line 
map <c-o> o<esc>
map <c-s-o> O<esc>
map <c-Space> a <esc>

map <c-CR> a<CR><esc>

" make
map <F12> <c-s>:make<CR>
imap <F12> <c-s><ESC>:make<CR>

" Put function parameter on a new line
map <F6> t,la<CR><ESC>

" Preferable behaviour
map Y y$

" Cleanup 
map <C-m> :%s/
//g<CR>

" Close buffer without closing the window
nmap <silent> <leader>d :bp\|bd #<CR>

" Setup Plugins
" -------------

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'embear/vim-localvimrc'
Plug 'einfachtoll/didyoumean'
Plug 'ElmCast/elm-vim'

call plug#end()


" elm-vim options
" ---------------

let g:elm_format_autosave = 1


" Neomake options
" ---------------

autocmd! BufWritePost * Neomake

let g:neomake_open_list=2

let g:neomake_javascript_enabled_makers = ['eslint']


let g:neomake_typescript_tsc_maker = {
      \ 'args': [],
      \ 'append_file': 0,
      \ 'errorformat':
      \ '%E%f %#(%l\,%c): error %m,' .
      \ '%E%f %#(%l\,%c): %m,' .
      \ '%Eerror %m,' .
      \ '%C%\s%\+%m'
      \ }

" let g:neomake_typescript_tslint_maker = {
"       \ 'args': ['--verbose'],
"       \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"       \ }

let g:neomake_typescript_enabled_makers = ['tsc', 'tslint']

" typescript-vim options
" ----------------------

let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc


" Ctrl-P options
" --------------

let g:ctrlp_map = '<leader>t'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
 \ 'dir': 'node_modules'
 \ }

" vim-localvimrc options
" ----------------------

let g:localvimrc_persistent = 1

" wildfire.vim options
" --------------------

let g:wildfire_fuel_map = '<leader>f'
let g:wildfire_water_map = '<leader>g'

" vim-jsbeautify options
" ----------------------

autocmd FileType javascript noremap <buffer> <F8> :call JsBeautify()<cr>


" Syntastic Settings
" ------------------

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']

let g:syntastic_typescript_checkers = ['tsc']

let g:syntastic_typescript_tsc_args = '--target es6 --jsx preserve --noImplicitAny'

" Typescript Vim Settings
" ----------------------

let g:typescript_compiler_options = '--target es6 --jsx preserve --noImplicitAny'

let g:syntastic_typescript_tsc_fname = ''


if has('nvim')
    " Neovim-qt Guifont command
    command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
    Guifont DejaVu Sans Mono:h11
    " Guifont Monospace:h11

	" Enable true colors in terminal
	set termguicolors

	" Use deoplete.
	let g:deoplete#enable_at_startup = 1

	" Show filename, etc, in terminal window title
	set title

	" Display 'line' cursor in insert mode
	" from: https://github.com/neovim/neovim/wiki/FAQ#how-can-i-change-the-cursor-shape-in-the-terminal
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
