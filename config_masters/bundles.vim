set nocompatible
filetype off

" Load plugins (with vundle)
set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#rc()
" call vundle#begin('~/.vim/bundle/Vundle.vim')
call vundle#begin('~/.vim/bundle/Vundle.vim')
"
" Let Vundle mange itself, required
Plugin 'VundleVim/Vundle.vim'
"
" See information abotu CtrlP below, this is faster search for it
" Plugin 'FelikZ/ctrlp-py-matcher'
" Show icons for modified lines
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'
"
" Syntax for PlantUML files
" Plugin 'aklt/plantuml-syntax'
"
" vim syntax file for plantuml
" https://github.com/aklt/plantuml-syntax
" Plugin 'aklt/plantuml-syntax'
" vim syntax for yaml files
" https://github.com/avakhov/vim-yaml
Plugin 'avakhov/vim-yaml'
"
" Nice status bar for Vim
" https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'
"
" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
" https://github.com/bronson/vim-trailing-whitespace
Plugin 'bronson/vim-trailing-whitespace'
"
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" http://kien.github.io/ctrlp.vim/
" Plugin 'ctrlpvim/ctrlp.vim'
"
" Semantic language support for Python
" https://github.com/davidhalter/jedi-vim
Plugin 'davidhalter/jedi-vim'
"
" Syntax for json files
Plugin 'elzr/vim-json'
"
" Vim script for text filtering and alignment
" https://github.com/godlygeek/tabular
Plugin 'godlygeek/tabular'
"
" toggle cursor for vim
Plugin 'jszakmeister/vim-togglecursor'
"
" Support for python
Plugin 'klen/python-mode'
"
" A possible replacement for YCM
" https://github.com/lifepillar/vim-mucomplete.git
Plugin 'lifepillar/vim-mucomplete'
"
" Browser for tags
Plugin 'majutsushi/tagbar'
"
" Ag search, use it instead of grep; depricated, loading ack.vim instead
" Plugin 'rking/ag.vim'
" Plugin 'mileszs/ack.vim'
"
" Flake8 syntax and style checker for Python
Plugin 'nvie/vim-flake8'
"
" Support for markdown
Plugin 'plasticboy/vim-markdown'
"
" File browser
Plugin 'scrooloose/nerdtree'
"
" Commenter
Plugin 'scrooloose/nerdcommenter'
"
" Inline previews of PlantUML sequence diagrams
" Plugin 'scrooloose/vim-slumlord'
"
" Syntax for tmux files
Plugin 'tmux-plugins/vim-tmux'
"
" Make vim to work better in tmux
" Plugin 'tmux-plugins/vim-tmux-focus-events'
"
" Git wrapper
Plugin 'tpope/vim-fugitive'
"
" repeat.vim extends . command repetition to some pluggins
Plugin 'tpope/vim-repeat'
"
" Additional surround snippets
Plugin 'tpope/vim-surround'
"
" Good shortcuts for switching between different lists
Plugin 'tpope/vim-unimpaired'
"
" YouCompleteMe code completion
" Plugin 'Valloric/YouCompleteMe'
"
" LaTeX Suite
" https://github.com/vim-latex/vim-latex
" Plugin 'vim-latex/vim-latex'
"
" Vim Misc plugin
Plugin 'xolox/vim-misc'
"
" Syntax linters
Plugin 'vim-syntastic/syntastic'
"
" Exuberant cTags management
Plugin 'xolox/vim-easytags'
"
" Kotlin syntax checker
"
Plugin 'udalov/kotlin-vim'
"
call vundle#end()               " required
filetype plugin indent on       " required

let g:ycm_python_interpreter_path = ""
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \ 'g:ycm_python_interpreter_path',
  \ 'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
