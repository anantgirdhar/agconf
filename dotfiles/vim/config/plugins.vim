" Plugins
" To install, run :PlugInstall (after reloading .vimrc)
" To update, run :PlugUpdate
" To remove plugins, run :PlugClean
" But before loading plugged, install it if it's not already present
if empty(glob('$XDG_DATA_HOME/vim/autoload/plug.vim'))
  silent !curl -fLo $XDG_DATA_HOME/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  " --sync | source $MYVIMRC
endif
call plug#begin('$XDG_DATA_HOME/vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree'
Plug 'haya14busa/is.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale', {'for': 'python'}
Plug 'ap/vim-css-color'
Plug 'kovetskiy/sxhkd-vim'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lervag/vimtex'
Plug 'ledger/vim-ledger'
call plug#end()

source $HOME/.config/vim/config/plugin_settings/vim_markdown.vim
source $HOME/.config/vim/config/plugin_settings/vimtex.vim

let g:ale_linters = {'python': ['mypy', 'pylsp']}
let g:ale_fixers = {'python': ['black', 'autoimport', 'isort']}
let g:ale_fix_on_save = 1
let g:ale_python_black_options='--line-length=79'
let g:ale_python_mypy_options='--strict'
