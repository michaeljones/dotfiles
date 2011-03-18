" Restructured text specific
" ==========================

" only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Setup tabs
setlocal expandtab

setlocal tabstop=3
setlocal softtabstop=3
setlocal shiftwidth=3

" Set line length
setlocal textwidth=80


