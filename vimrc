" Basic Preferences
set nocompatible

" Setup Plugins
" -------------

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'embear/vim-localvimrc'
Plug 'einfachtoll/didyoumean'
Plug 'Zaptic/elm-vim', { 'tag': '0.19.0.1' }
Plug 'Quramy/tsuquyomi'
Plug 'elixir-editors/vim-elixir'
Plug 'chiel92/vim-autoformat'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'kewah/vim-stylefmt'
Plug 'pearofducks/ansible-vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'craigemery/vim-autotag'
Plug 'hail2u/vim-css3-syntax'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Recommended in :help netrw-ml_get to silence ml_get errors
let g:netrw_use_noswf= 0

" Disable netrw
let loaded_netrwPlugin = 1

set exrc            " enable per-directory .vimrc files
set secure          " disable unsafe commands in local .vimrc files

if has("vms")
	set nobackup
else
	set backup
	set backupcopy=yes
	set backupdir=/tmp
	set directory=/tmp
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

" Key bindings
" ------------

map <C-j> :bnext<CR>
map <C-k> :bprevious<CR>

imap <C-j> <ESC>:bnext<CR>
imap <C-k> <ESC>:bprevious<CR>

map <c-del> <ESC>
imap <c-del> <ESC>

" Ctags
map <A-n> :cprevious<CR>
map <A-m> :cnext<CR>

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

" Close buffer without closing the window
nmap <silent> <leader>d :bp\|bd #<CR>


" Python Options
" --------------
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1

" autoformat options
" ------------------

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" rust.vim options
" ----------------

let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1

" Elixir options
" --------------
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

" Prettier options
" ----------------

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" vim-css3-syntax
" ---------------

" From the project README: https://github.com/hail2u/vim-css3-syntax
augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END


" elm-vim options
" ---------------

let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 0
let g:elm_delete_elm_stuff_on_fail = 1
let g:elm_make_output_file = '/dev/null'

" fzf.vim options
" ---------------

nmap <leader>v :FZF<CR>

" Using floating windows of Neovim to start fzf
if has('nvim')
  let $FZF_DEFAULT_COMMAND = 'fdfind --type file'
  let $FZF_DEFAULT_OPTS = ' --color=dark --layout=reverse --margin=1,4'

  hi FloatWindowBackground guibg=grey24

  function! FloatingFZF()
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    let win = nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:FloatWindowBackground')
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

" rust-vim options
" ----------------

let g:rustfmt_autosave = 1

" Neomake options
" ---------------

" autocmd! BufWritePost * Neomake

let g:neomake_open_list=2

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_rust_enabled_makers = []

let g:neomake_typescript_enabled_makers = ['tslint']

let g:neomake_rust_enabled_makers = []

" vim-localvimrc options
" ----------------------

let g:localvimrc_persistent = 1

" wildfire.vim options
" --------------------

let g:wildfire_fuel_map = '<leader>f'
let g:wildfire_water_map = '<leader>g'

if has('nvim')
    " Neovim-qt Guifont command
    command -nargs=? Guifont call rpcnotify(0, 'Gui', 'SetFont', "<args>") | let g:Guifont="<args>"
    Guifont DejaVu Sans Mono:h11
    " Guifont Monospace:h11

  " Inccommand
  set inccommand=nosplit

	" Enable true colors in terminal
	set termguicolors

	" Use deoplete.
	let g:deoplete#enable_at_startup = 1

	" Show filename, etc, in terminal window title
	set title

	" Display 'line' cursor in insert mode
	" from: https://github.com/neovim/neovim/wiki/FAQ#how-can-i-change-the-cursor-shape-in-the-terminal
	let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

	inoremap <expr><c-j> pumvisible() ? "\<c-n>" : "\<c-j>"
	inoremap <expr><c-k> pumvisible() ? "\<c-p>" : "\<c-k>"

	set clipboard+=unnamedplus

	function! ClipboardYank()
	  call system('xclip -i -selection clipboard', @@)
	endfunction
	function! ClipboardPaste()
	  let @@ = system('xclip -o -selection clipboard')
	endfunction

	vnoremap <silent> y y:call ClipboardYank()<cr>
	vnoremap <silent> d d:call ClipboardYank()<cr>
endif
