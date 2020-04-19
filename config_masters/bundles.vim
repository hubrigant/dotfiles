if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim')
    Plug 'junegunn/vim-plug'
    Plug 'airblade/vim-gitgutter'
    Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
    Plug 'bling/vim-airline'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'davidhalter/jedi-vim'
    Plug 'ervandew/supertab'
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'godlygeek/tabular'
    " Plug 'jszakmeister/vim-togglecursor'
    " Plug 'klen/python-mode'
    Plug 'matze/vim-lilypond', { 'for': 'lilypond' }
    Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
    Plug 'xolox/vim-easytags'
    Plug 'vim-syntastic/syntastic'
    Plug 'xolox/vim-misc'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'preservim/nerdcommenter'
    " Plug 'scrooloose/nerdtree'
    Plug 'plasticboy/vim-markdown'
call plug#end()

"set jedi-vim options
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command <C-A-space>
