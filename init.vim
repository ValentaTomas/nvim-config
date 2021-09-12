" https://betterprogramming.pub/setting-up-neovim-for-web-development-in-2020-d800de3efacd

" Plugin Section

call plug#begin('~/.vim/plugged')
  " Plug 'ayu-theme/ayu-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'  
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'mhinz/vim-startify'
call plug#end()

" Config Section

if (has('termguicolors'))
 set termguicolors
endif
syntax enable
" let ayucolor="mirage"
" colorscheme ayu
colorscheme nord

let g:startify_custom_header = []
" Toggle
nnoremap <leader>v <cmd>CHADopen<cr>

nnoremap <C-i> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

set number                     " Show current line number
set relativenumber             " Show relative line numbers

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://fish
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
