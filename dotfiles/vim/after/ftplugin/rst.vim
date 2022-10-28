setlocal shiftwidth=3
setlocal tabstop=3
setlocal softtabstop=3
setlocal expandtab

setlocal textwidth=79

setlocal spell spelllang=en_us

let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" Macro to update the last updated timestamp
function! UpdateLastUpdatedTime()
  :normal G
  :let @t="Last updated: " .strftime('%a %d %b %Y %H:%M:%S %Z')
  :silent! %s/^Last updated:.*/\=@t/
endfunction
nnoremap <buffer> <localleader>u :call UpdateLastUpdatedTime()<CR>

" Update heading tag lengths based on heading character length
function! CreateHeaderLines(symbol, header)
  " If there is no text in the header (usually happens when a new header is
  " being created), set the length to 3. Otherwise, there are no headers
  " symbols and later, while trying to update the length of the header
  " symbols, nothing is found and so the header symbols never reappear.
  let len = max([strlen(a:header), 3])
  let formatted = a:header . "\n" . repeat(a:symbol, len)
  return formatted
endfunction

function! UpdateHeader(char)
  mark `
  if a:char ==# "="
    :silent! %s/\(.*\)\n===\+$/\=CreateHeaderLines("=", submatch(1))/g
  elseif a:char ==# "-"
    :silent! %s/\(.*\)\n---\+$/\=CreateHeaderLines("-", submatch(1))/g
  elseif a:char ==# "^"
    :silent! %s/\(.*\)\n^^^\+$/\=CreateHeaderLines("^", submatch(1))/g
  endif
  normal! ``
endfunction

" augroup rst_header_autocmds
"   autocmd!
"   autocmd InsertLeave *.rst :call UpdateHeader("=")
"   autocmd InsertLeave *.rst :call UpdateHeader("-")
"   autocmd InsertLeave *.rst :call UpdateHeader("^")
" augroup END

nnoremap <buffer> <localleader>h :call UpdateHeader("=")<CR>:call UpdateHeader("-")<CR>:call UpdateHeader("^")<CR>

" Eatchar function to consume the extra space when abbreviations are expanded
" https://stackoverflow.com/questions/11858927/preventing-trailing-whitespace-when-using-vim-abbreviations
func Eatchar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

" Keybindings to insert some commonly used things
inoreabbrev <buffer> ref@ :ref:``<++><Esc>F`i<C-R>=Eatchar('\s')<CR>
inoreabbrev <buffer> math@ :ref:``<++><Esc>F`i<C-R>=Eatchar('\s')<CR>
inoreabbrev <buffer> cite@ :cite:``<++><Esc>F`i<C-R>=Eatchar('\s')<CR>
inoreabbrev <buffer> fig@ .. figure:: <CR>:scale: <++><CR><CR>   <++><CR><CR><Esc>i<++><Esc>5k$i
inoreabbrev <buffer> code@ .. code-block::<CR><CR><++><Esc>2kA

" Create headings
inoreabbrev <buffer> h#@ ###<CR><CR>###<CR><CR><++><Esc>3ki<C-R>=Eatchar('\s')<CR>
inoreabbrev <buffer> h*@ ***<CR><CR>***<CR><CR><++><Esc>3ki<C-R>=Eatchar('\s')<CR>
inoreabbrev <buffer> h1@ <CR>===<CR><CR><++><Esc>3ki<C-R>=Eatchar('\s')<CR>
inoreabbrev <buffer> h2@ <CR>---<CR><CR><++><Esc>3ki<C-R>=Eatchar('\s')<CR>
inoreabbrev <buffer> h3@ <CR>^^^<CR><CR><++><Esc>3ki<C-R>=Eatchar('\s')<CR>
