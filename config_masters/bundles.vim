if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim')
    Plug 'ervandew/supertab' " Moved out of order to the top to fix runtime error
    Plug 'junegunn/vim-plug'
    Plug 'bling/vim-airline'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'xolox/vim-easytags'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'davidhalter/jedi-vim'
    Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
    Plug 'matze/vim-lilypond', { 'for': 'lilypond' }
    Plug 'plasticboy/vim-markdown'
    Plug 'xolox/vim-misc'
    Plug 'preservim/nerdcommenter'
    " Plug 'scrooloose/nerdtree'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'sirtaj/vim-openscad', { 'for': 'openscad' }
    Plug 'klen/python-mode'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'vim-syntastic/syntastic'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'godlygeek/tabular'
    Plug 'jszakmeister/vim-togglecursor'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'tpope/vim-unimpaired'
    Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
call plug#end()

"set jedi-vim options
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command <C-A-space>
