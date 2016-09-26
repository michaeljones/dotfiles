" JS Specific
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

nmap <buffer> <leader>e iconsole.log('');<ESC>2hi
imap <buffer> <leader>e console.log('');<ESC>2hi

" Binding to change 'require' to 'import' syntax
map <F6> 0cwimport<ESC>wwcf(from <ESC>$xxA;<ESC>

setlocal suffixesadd+=.js,.jsx,.ts,.tsx
