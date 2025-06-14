" Plugin Management

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sile-typesetter/vim-sile'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
call plug#end()

" General Settings
syntax on
set nocompatible
set history=1000
setlocal spell spelllang=en_gb
set mouse=a
set nobackup
set encoding=utf-8
set clipboard=unnamed " on Linux this needs to be unnamedplus

" Interface
set number
set relativenumber
set showcmd
set showmode
set showmatch
set termguicolors
set wildmode=longest,list,full
set background=dark

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Mappings
nnoremap <C-n> :NERDTreeToggle<CR>
