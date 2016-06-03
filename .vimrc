set nocompatible              " be iMproved, required
filetype off                  " required
set number
syntax on
set t_Co=256
set term=xterm-256color
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/csapprox'
Plugin 'Raimondi/delimitMate'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'majutsushi/tagbar'
Plugin 'derekwyatt/vim-scala'
Plugin 'ensime/ensime-vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " required
filetype plugin indent on    " required

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1 
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:solarized_termcolors=256
let g:solarized_termtrans=1
syntax enable
set background=dark
colorscheme solarized
set guifont=Meslo\ LG\ M\ 12
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
 set guioptions-=r  "scrollbar

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set laststatus=2

" unicode symbols

let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

let g:airline_left_sep = ''
let g:airline_right_sep = ''



filetype indent on

nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=40 columns=120 
  winpos 350 100
else
endif

