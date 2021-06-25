" Vim filetype detection plugin
" Language:		Graphviz

augroup filetypedetect
	au BufRead,BufNewFile *.gv  setf dot
	au BufRead,BufNewFile *.dot setf dot
augroup END
