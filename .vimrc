
"---------------------------------------------------------------------------
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

"---------------------------------------------------------------------------
" follow tag
function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

nnoremap <F2> :call FollowTag()<CR>

"---------------------------------------------------------------------------
" toggle line comment
" TODO: Optimize code to remove duplicate
function! IsLineCommentedC()
  " save cursor position
  let save_cursor = getpos(".")

  " move cursor to the beginning of line
  call cursor(line("."), 1)
  
  " search comment pattern '//' at the start of line
  let search_result = search('^\s*\/\/', "c", line("."))     " c-like comment //

  " set cursor back on the saved position
  call setpos('.', save_cursor)

  return search_result ? 1 : 0
endfunction

function! ToggleCommentC()
  let isCommented = IsLineCommentedC()

  " save cursor position
  let second_save_cursor = getpos(".")

  if isCommented
    :s!\/\/\s*!!  " c-like //
  else
    :s!^\s*!\0// ! " c-like //
  endif

  " set cursor back on the saved position with comment-sign size offset
  call setpos(".", second_save_cursor)

endfunction

function! IsLineCommentedP()
  " save cursor position
  let save_cursor = getpos(".")

  " move cursor to the beginning of line
  call cursor(line("."), 1)
  
  " search comment pattern '//' at the start of line
  let search_result = search('^\s*#', "c", line("."))       " python-like #

  " set cursor back on the saved position
  call setpos('.', save_cursor)

  return search_result ? 1 : 0
endfunction

function! ToggleCommentP()
  let isCommented = IsLineCommentedP()

  " save cursor position
  let second_save_cursor = getpos(".")

  if isCommented
    :s!#\s*!!     " python-like #
  else
    :s!^(\s)*!\0# ! " python-like #
  endif

  " set cursor back on the saved position with comment-sign size offset
  call setpos(".", second_save_cursor)

endfunction

nnoremap <C-?> :call ToggleCommentP()<CR>
nnoremap <C-_> :call ToggleCommentC()<CR>

"---------------------------------------------------------------------------
" highlight if line lenght bigger than 111
 " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
 " match OverLength /\%111v.\+/
noremap <c-]> :call FollowTag()<CR>
