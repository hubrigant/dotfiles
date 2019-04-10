set nocompatible
filetype off

" Load plugins (with vundle)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'


" call vundle#begin('~/.vim/bundle/Vundle.vim')
" See information abotu CtrlP below, this is faster search for it
" Plugin 'FelikZ/ctrlp-py-matcher'
" Show icons for modified lines
" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'
" vim syntax file for plantuml
" https://github.com/aklt/plantuml-syntax
" Plugin 'aklt/plantuml-syntax'
" vim syntax for yaml files
" https://github.com/avakhov/vim-yaml
Plugin 'avakhov/vim-yaml'
" Nice status bar for Vim
" https://github.com/bling/vim-airline
Plugin 'bling/vim-airline'
" Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
" https://github.com/bronson/vim-trailing-whitespace
Plugin 'bronson/vim-trailing-whitespace'
" Seamless navigation between tmux panes and vim splits
" Plugin 'christoomey/vim-tmux-navigator'
" Syntax for dockerfile
Plugin 'ekalinin/Dockerfile.vim'
" Syntax for json files
Plugin 'elzr/vim-json'
" Support for golang
" Plugin 'fatih/vim-go'
" Let Vundle mange itself, required
" Plugin 'gmarik/Vundle.vim'
Plugin 'VundleVim/Vundle.vim'
" Match tag for html tags
" Plugin 'gregsexton/MatchTag'
" css3 syntax
Plugin 'hail2u/vim-css3-syntax'
" javascript additional syntax
Plugin 'jelera/vim-javascript-syntax'
" toggle cursor for vim
Plugin 'jszakmeister/vim-togglecursor'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" http://kien.github.io/ctrlp.vim/
Plugin 'kien/ctrlp.vim'
" Support for python
Plugin 'klen/python-mode'
" Support for typescript
" Plugin 'leafgarland/typescript-vim'
" JavaScript indent plugin
Plugin 'lukaszb/vim-web-indent'
" Browser for tags
Plugin 'majutsushi/tagbar'
" Syntax for some javascript libraries
Plugin 'othree/javascript-libraries-syntax.vim'
" Support for markdown
Plugin 'plasticboy/vim-markdown'
" Ag search, use it instead of grep
Plugin 'rking/ag.vim'
" File browser
Plugin 'scrooloose/nerdtree'
" Syntax linters
Plugin 'scrooloose/syntastic'
" Monokai theme for vim
" Plugin 'sickill/vim-monokai'
" Syntax for tmux files
Plugin 'tmux-plugins/vim-tmux'
" Make vim to work better in tmux
Plugin 'tmux-plugins/vim-tmux-focus-events'
" Git wrapper
Plugin 'tpope/vim-fugitive'
" Additional surround snippets
Plugin 'tpope/vim-surround'
" Good shortcuts for switching between different lists
Plugin 'tpope/vim-unimpaired'
call vundle#end()               " required
filetype plugin indent on       " required
