" Initialise Pathogen Setup
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Basic Preferences
set nocompatible		" don't worry about Vi compatibility

if has("vms")
	set nobackup
else
	set backup
	set backupdir=/tmp/vim_backups,/tmp
	set directory=/tmp/vim_swap,/tmp
endif

set list
set listchars=tab:‣\ ,eol:¬,trail:·,precedes:.

" Colour settings
set background=dark
colorscheme desert
syntax on
filetype on

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
autocmd BufNewFile,BufRead *.log set nowrap
autocmd BufNewFile,BufRead *.do set filetype=sh

augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

highlight Pmenu guibg=brown gui=bold

set fileformat=unix
set fileformats=unix

set history=50			" remember 50 commands
set showcmd				" show currently typed sequence in the bottom right
set hidden				" allow modified buffers to be left in the background

filetype plugin indent on

set backspace=eol,start,indent
set incsearch			" searches as you type instead of waiting for <CR>
set hlsearch			" enables highlighting for search results

" MiniBufferExplorer Options
" --------------------------
" let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplVSplit = 20
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
" 
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
map <F6> t,;a<CR><ESC>

" Preferable behaviour
map Y y$

" Cleanup 
map <C-m> :%s///g<CR>

