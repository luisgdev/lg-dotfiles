source $VIMRUNTIME/defaults.vim
set incsearch
set laststatus=2
set encoding=utf-8
set relativenumber
set numberwidth=4
set colorcolumn=81
set ignorecase
set hlsearch


" Settings for vim-plug 
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/vim-plug'
Plug 'nvie/vim-flake8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Colorschemes
Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'whatyouhide/vim-gotham'
Plug 'ajmwagar/vim-deus'
Plug 'glepnir/oceanic-material'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plugins become visible to Vim after this call.
call plug#end()


" Settings for Lightline 
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ }
" Trim the fileformat and encoding info on narrow windows
function! LightlineFileformat()
      return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
      return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction


" Settings for Colorscheme
syntax enable
colorscheme monokai
set background=dark
set termguicolors
set t_Co=256


" Settings for coc.nvim
" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
endfunction


