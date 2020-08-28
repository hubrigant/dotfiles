" if empty(glob('~/.vim/autoload/plug.vim'))
"     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.config/nvim')
    Plug 'ervandew/supertab' " Moved out of order to the top to fix runtime error
    " Plug 'bling/vim-airline'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'xolox/vim-easytags', { 'for': ['json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'davidhalter/jedi-vim', { 'for': ['json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
    Plug 'matze/vim-lilypond', { 'for': 'lilypond' }
    Plug 'itchyny/lightline.vim'
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'xolox/vim-misc'
    Plug 'preservim/nerdcommenter', { 'for': ['json', 'kotlin', 'lilypond', 'markdown', 'vim', 'zsh'] }
    " Plug 'scrooloose/nerdtree'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'sirtaj/vim-openscad', { 'for': 'openscad' }
    Plug 'junegunn/vim-plug'
    Plug 'klen/python-mode', { 'for': 'python' }
    Plug 'tpope/vim-repeat'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'vim-syntastic/syntastic', { 'for': ['json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'godlygeek/tabular'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'jszakmeister/vim-togglecursor'
    Plug 'bronson/vim-trailing-whitespace', { 'for': ['json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-unimpaired', { 'for': ['json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
call plug#end()

"set jedi-vim options
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command <C-A-space>
