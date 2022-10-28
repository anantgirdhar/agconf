filetype plugin indent on
syntax on

" Always delete the previous word
" The default behavior is to delete previous words in the text entered after
" last starting insert mode, and stops deleting text at the beginning of a
" line.
set backspace=indent,eol,start

set number relativenumber
set autoindent "smartindent
set incsearch
set ignorecase smartcase
set wildmode=longest,list,full

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set tabpagemax=100
set timeoutlen=1000

set splitbelow splitright

colorscheme tokyonight
" set background=dark
" highlight Normal ctermfg=none ctermbg=none

" Disallow comments from continuing on new lines
set formatoptions-=r
set formatoptions-=o
autocmd FileType * set formatoptions-=r
autocmd FileType * set formatoptions-=o

" Remove trailing whitespace on save
fun! StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  keepp %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre <buffer> :call StripTrailingWhitespace()

" Turn on conceal - useful, for example, in markdown documents
set conceallevel=2

" ctags configuration
set tags=./tags,tags;$HOME
