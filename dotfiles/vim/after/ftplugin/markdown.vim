setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2
setlocal expandtab

setlocal textwidth=79

setlocal spell spelllang=en_us

let b:table_mode_corner_corner='+'
let b:table_mode_header_fillchar='='
let b:table_mode_corner = '+'

function! InsertCitation()
  set noshelltemp  " Use pipes instead of temp files for shell commands
  read ! clarence searchfzf -m
  set shelltemp
endfunction

function! InsertCitation2()
  let tempfile=tempname()
  execute '! clarence searchfzf -m > ' . shellescape(tempfile)
  execute 'read' . tempfile
  call delete(tempfile)
endfunction

" Macro to update the last updated timestamp
function! UpdateLastUpdatedTime()
  :normal G
  :silent let t = system('date "+%Y-%m-%d %H:%M:%S %Z %:::z" | tr -d "\n"')
  :silent! %s/- read_status: unread/- read_status: read/
  :execute ':%s/\v^(updated|\s*- date_updated): .*/\1: ' . t . "/"
endfunction
nnoremap <buffer> <localleader>u :call UpdateLastUpdatedTime()<CR>

" inoreabbrev <buffer> [@ [<CR>]<Esc>k:call InsertCitation()<CR>kJJf]a
" inoreabbrev <buffer> @ <CR>]<Esc>k:call InsertCitation()<CR>kJJcf]

inoreabbrev <buffer> [@ [<CR>]<Esc>k:call InsertCitation2()<CR><CR>kJJf]a
inoreabbrev <buffer> @ <CR>]<Esc>k:call InsertCitation2()<CR><CR>kJJcf]
