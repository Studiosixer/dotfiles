call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'PProvost/vim-ps1'
Plug 'christianrondeau/vim-base64'
Plug 'ekalinin/Dockerfile.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

set nowrap
set number
set nocompatible

au FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab wrap
au FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType sh setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
au FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" python-mode
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_on_fly = 1

" nnoremap <unique> <leader><cr> :JavaSearchContext<cr> :only<cr> 
" nnoremap <leader>d :JavaDocSearch -x declarations<cr>

nnoremap <leader>\t :bel vert term<cr>
