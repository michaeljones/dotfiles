" Mel Specific
" ============

" only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif


" Error call - Print to shell
map  <buffer> <C-e> atrace("");<ESC>2hi
imap <buffer> <C-e> trace("");<ESC>2hi

" Print call - Print to script editor
map  <buffer> <C-c> aprint("\n");<ESC>4hi
imap <buffer> <C-c> print("\n");<ESC>4hi

" Source the entire mel script
map  <buffer> <Leader>s :!mcp vimSource \"%\"<CR>

" Save out the fragment we have highlighted and source that
vmap <buffer> <Leader>s :w! $TMPDIR/mel_fragment.mel<CR>:!mcp vimSource \"$TMPDIR/mel_fragment.mel\"<CR>


