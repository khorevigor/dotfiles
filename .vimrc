set number
syntax on
:au SwapExists * let v:swapchoice = 'e'

" set tab to 2 spaces
 set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" " include FT tags file
" set tags=/local/scratch/ezkhoih/ft/bin/.build/tags

 " global copy-paste 
 vnoremap <C-c> "+y
 nnoremap <C-v> "+p

 " xclip copy-paste
 vnoremap <F7> :w !xclip<CR><CR>
 nnoremap <S-F7> :r !xclip -o<CR>

 " search selected
 vnoremap <C-_> y/<C-r>"

 " swap splits with each other
 function! MarkWindowSwap()
     let g:markedWinNum = winnr()
 endfunction

 function! DoWindowSwap()
   "Mark destination
   let curNum = winnr()
   let curBuf = bufnr( "%" )
   exe g:markedWinNum . "wincmd w"
   "Switch to source and shuffle dest->source
   let markedBuf = bufnr( "%" )
   "Hide and open so that we aren't prompted and keep history
   exe 'hide buf' curBuf
   "Switch to dest and shuffle source->dest
   exe curNum . "wincmd w"
   "Hide and open so that we aren't prompted and keep history
   exe 'hide buf' markedBuf 
endfunction

noremap <silent> <leader>mw :call MarkWindowSwap()<CR>
noremap <silent> <leader>pw :call DoWindowSwap()<CR>

function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " .  expand("<cword>")
endfunction

nnoremap <c-]> :call FollowTag()<CR>
