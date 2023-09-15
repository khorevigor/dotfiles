if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au BufNewFile,BufRead *.ttcn  setf ttcn
augroup END
