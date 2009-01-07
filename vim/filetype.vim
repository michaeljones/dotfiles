" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.mkd		setfiletype mkd
  au! BufRead,BufNewFile *.sl		setfiletype sl
  au! BufRead,BufNewFile *.asd		setfiletype asciidoc
augroup END

