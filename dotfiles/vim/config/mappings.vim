let mapleader = " "
let maplocalleader = "`"

" Make splits easier to work with
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
inoremap <C-h> <Esc><C-w><C-h>
inoremap <C-j> <Esc><C-w><C-j>
inoremap <C-k> <Esc><C-w><C-k>
inoremap <C-l> <Esc><C-w><C-l>

" Swap the goto mark behavior
nnoremap ' `
nnoremap ` '

" Since backtick is localleader, pressing two backticks will insert a single
" backtick instead of having to wait for the timeout to kick in and prevent
" activating some other insert mode binding.
inoremap `` `

" Since expand tab is on, insert a real tab using Shift+Tab
inoremap <S-Tab> <C-V><Tab>

" Easier .vimrc access
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Uppercase a word in insert mode
inoremap <c-u> <esc>viwUea

" External command keybindings
nnoremap <leader>c :!$AGSCRIPTS/compiler %:p<CR>
nnoremap <leader>v :!$AGSCRIPTS/preview %:p &<CR>

" Copy to and paste from clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>d "+d
vnoremap <leader>y "+y
vnoremap <leader>p "+p
vnoremap <leader>d "+d

" Keybindings for easy movement with content tags
nnoremap <leader><leader> /<++><CR>"_c4l

" Keybindings for fzf
nnoremap <leader>f :Files<CR>

" Toggle various features
nnoremap <C-s> :set spell!<CR>
inoremap <C-s> <Esc>:set spell!<CR>i
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <localleader>n :set number!<CR>
nnoremap <localleader>r :set relativenumber!<CR>
nnoremap <C-b> :TableModeToggle<CR>
