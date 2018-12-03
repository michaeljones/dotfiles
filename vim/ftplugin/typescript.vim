" Typescript Specific
" -------------------

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

setlocal expandtab

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

setlocal textwidth=120

setlocal suffixesadd+=index.ts,.ts,.tsx

" Convert 'word' to '(word: any)'
" map <buffer> <leader>f bi(<ESC>lea: any)<ESC>
map <buffer> <leader>g ea: any<ESC>
map <buffer> <leader>r a;<ESC>:lne<CR>
map <buffer> <leader>b :TsuGeterrProject<CR>
map <buffer> <C-]> <Plug>(TsuquyomiDefinition)
