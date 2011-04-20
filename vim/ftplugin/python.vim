" Python Specific
" ===============

" only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

setlocal expandtab

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

" map  <buffer> <C-e> asys.stderr.write("\n")<ESC>3hi
" imap <buffer> <C-e> sys.stderr.write("\n")<ESC>3hi

" map  <buffer> <C-c> aprint ""<ESC>i
" imap <buffer> <C-c> print ""<ESC>i

