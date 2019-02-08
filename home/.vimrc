call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'PProvost/vim-ps1'
Plug 'francoiscabrol/ranger.vim'
Plug 'christianrondeau/vim-base64'
Plug 'ekalinin/Dockerfile.vim'
Plug 'python-mode/python-mode', { 'branch': 'develop' }

call plug#end()

set nowrap
set number
set nocompatible

au FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
au FileType java setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab
au FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ranger.vim
map <C-t> :RangerCurrentFileNewTab<CR>
map <C-f> :RangerCurrentFile<CR>

" python-mode
let g:pymode_python = 'python3'
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_on_fly = 1


nnoremap <unique> <leader><cr> :JavaSearchContext<cr> :only<cr> 
nnoremap <leader>d :JavaDocSearch -x declarations<cr>

