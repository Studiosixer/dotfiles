set nowrap
set number

set nocompatible
filetype plugin indent on
au FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>

call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'PProvost/vim-ps1'
Plug 'francoiscabrol/ranger.vim'
Plug 'christianrondeau/vim-base64'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ranger.vim
map <C-t> :RangerCurrentFileNewTab<CR>
map <C-f> :RangerCurrentFile<CR>

