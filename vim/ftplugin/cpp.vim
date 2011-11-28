" C++ Specific
" ------------

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

setlocal expandtab

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal textwidth=100

" Alternate (a.vim) configuration
"
let g:alternateExtensions_hh = "cc"
let g:alternateExtensions_cc = "hh"

" Alternate (a.vim) binding
"
nmap <buffer> <leader>a :A<CR>

" Print Error
map  <buffer> <leader>e astd::cerr << "mpj-debug: " << std::endl;<ESC>14hi
imap <buffer> <leader>e std::cerr << "mpj-debug: " << std::endl;<ESC>14hi

map  <buffer> <leader>s typedef std::tr1::shared_ptr<  ><ESC>hi
imap <buffer> <leader>s typedef std::tr1::shared_ptr<  ><ESC>hi

" " Print Standard
" map  <buffer> <C-c> astd::cout << "" << std::endl;<ESC>14hi
" imap <buffer> <C-c> std::cout << "" << std::endl;<ESC>14hi

" Print varible
" map  <buffer> <C-f> bywostd::cerr << "<Esc>pa" << <Esc>pa << std::endl;

" Comment out word
" map  <buffer> <C-z> T i/*<ESC>ea*/<ESC>

" Function header comment
" map  <buffer> <C-n> yyPO//<ESC>kt(T d0i//<tab><ESC>t(;Do<ESC>j



" Wrap visual selection in a comment.
" vmap <Leader>w <Esc>:call VisualComment()<CR>
" function! VisualComment()
" normal `>
" if &selection == 'exclusive'
"   exe "normal i/*"
" else
"   exe "normal a*/"
" endif
" normal `<
" exe "normal i<".tag.">"
" normal `<
" endfunction



" 
" function For(index, end)
" python << EOF
" import vim
" 
" b = vim.current.buffer
" row, col = vim.current.window.cursor
" 
" use_index = vim.eval('a:index')
" end = vim.eval('a:end')
" 
" r = b.range(row-1, row)
" forloop = ["for(int %s=0; %s<%s; ++%s)" % (use_index, use_index, end, use_index), "{", "", "}"]
" 
" for i in range(0, len(forloop)):
" 	forloop[i] = " " * col + forloop[i]
" 
" r.append(forloop)
" 
" EOF
" endf
" 
" command -nargs=* For :call For(<f-args>)
" 
" 
" function Bind(name)
" python << EOF
" import vim
" 
" b = vim.current.buffer
" row, col = vim.current.window.cursor
" 
" param = vim.eval('a:name')
" pParam = "p" + param[0].upper() + param[1:]
" 
" r = b.range(row-1, row)
" bind = ["bindParameter(\"%s\", %s);" % (param, pParam), "dbg_printf(ERR_INFO,\"got back %s\\n\",%s->name);" % ("%s", pParam), "%s->dumpParameter()" % (pParam)]
" 
" for i in range(0, len(bind)):
" 	bind[i] = "\t" + bind[i]
" 
" r.append(bind)
" 
" EOF
" endf
" 
" command -nargs=* Bind :call Bind(<f-args>)
" 


