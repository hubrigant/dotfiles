" enter the current millenium
set nocompatible

set history=500
syntax enable

"Enable filetype plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config copied, with minor edits, from...
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Maintainer:
 "       Amir Salihefendic — @amix3k
 "
 " Awesome_version:
 "       Get this config, nice color schemes and lots of plugins!
 "
 "       Install the awesome version from:
 "
 "           https://github.com/amix/vimrc
 "
 " Sections:
 "    -> General
 "    -> VIM user interface
 "    -> Colors and Fonts
 "    -> Files and backups
 "    -> Text, tab and indent related
 "    -> Visual mode related
 "    -> Moving around, tabs and buffers
 "    -> Status line
 "    -> Editing mappings
 "    -> vimgrep searching and cope displaying
 "    -> Spell checking
 "    -> Misc
 "    -> Helper functions
 "
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set to auto read when a file is changed from the outside
set autoread

" A map leader enables extra key combinations
let mapleader = ";"

" Use ag with the ack.vim plugin
if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif

" Fast saving
nmap <leader>w :w!<cr>

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" FINDING FILES
"
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=.git\*,.hg\*,.svn\*
else
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search and current cursor position
set hlsearch
set cursorline
set cursorcolumn

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
	autocmd GUIEnter * set vb t_vb=
endif

" Add a bit of extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable truecolor
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Enable 256 colors palatte in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

try
	colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the hstandard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN/git anyway
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab, and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

set smarttab

set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set ai   "Auto indent
set si   "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<CR=@/<CR><CR>
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>?<CR=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows, and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab=1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the direcotry of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") >1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

set statusline=\ %{FugitiveStatusline()}\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-j> :m'>+<cr>`<my`<mzgv`yo`z

if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

" Delete trailing whitespace on save, useful for some filetypes
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

if has("autocmd")
	autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpace()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing <leader>ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffere.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
 function! HasPaste()
     if &paste
         return 'PASTE MODE  '
     endif
     return ''
 endfunction

 " Don't close window, when deleting a buffer
 command! Bclose call <SID>BufcloseCloseIt()
 function! <SID>BufcloseCloseIt()
     let l:currentBufNum = bufnr("%")
     let l:alternateBufNum = bufnr("#")

     if buflisted(l:alternateBufNum)
         buffer #
     else
         bnext
     endif

     if bufnr("%") == l:currentBufNum
         new
     endif

     if buflisted(l:currentBufNum)
         execute("bdelete! ".l:currentBufNum)
     endif
 endfunction

 function! CmdLine(str)
     call feedkeys(":" . a:str)
 endfunction

 function! VisualSelection(direction, extra_filter) range
     let l:saved_reg = @"
     execute "normal! vgvy"

     let l:pattern = escape(@", "\\/.*'$^~[]")
     let l:pattern = substitute(l:pattern, "\n$", "", "")

     if a:direction == 'gv'
         call CmdLine("Ack '" . l:pattern . "' " )
     elseif a:direction == 'replace'
         call CmdLine("%s" . '/'. l:pattern . '/')
     endif

     let @/ = l:pattern
     let @" = l:saved_reg
 endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End of copied config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Config derrived from YouTube video https://youtu.be/XA2WjJbmmoM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAG JUMPING
"
" Create the 'tags' file
command! MakeTags !ctags -R .

" AUTOCOMPLETE
" The good stuff is docmumented in |ins-completion|
"
" Highlights:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with the path trick above)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete option
"
" Now we can:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING
" Tweaks for browsing
let g:netrw_banner=0		" disable annoying banner
let g:netrw_browse_split=4	" open in prior window
let g:netrw_altv=1		" open splits to the right
let g:netrw_liststyle=3		" tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Now we can
" - :edit a folder to open the file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps for more mappings

" SNIPPETS
" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load plugins via plug.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if empty(glob('~/.vim/autoload/plug.vim'))
"     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"         \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.config/nvim')
    Plug 'ervandew/supertab' " Moved out of order to the top to fix runtime error
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'xolox/vim-easytags', { 'for': ['python', 'json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'elzr/vim-json', { 'for': 'json' }
    Plug 'davidhalter/jedi-vim', { 'for': ['python', 'json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'udalov/kotlin-vim', { 'for': 'kotlin' }
    Plug 'matze/vim-lilypond', { 'on': 'lilypond' }
    Plug 'itchyny/lightline.vim'
    Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
    Plug 'xolox/vim-misc'
    Plug 'preservim/nerdcommenter', { 'for': ['python', 'json', 'kotlin', 'lilypond', 'markdown', 'vim', 'zsh', 'python'] }
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'sirtaj/vim-openscad', { 'for': 'openscad' }
    Plug 'junegunn/vim-plug'
    Plug 'klen/python-mode', { 'for': 'python' }
    Plug 'tpope/vim-repeat'
    Plug 'honza/vim-snippets'
    Plug 'tpope/vim-surround'
    Plug 'vim-syntastic/syntastic', { 'for': ['python', 'json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'godlygeek/tabular'
    Plug 'jszakmeister/vim-togglecursor'
    Plug 'bronson/vim-trailing-whitespace', { 'for': ['python', 'json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'lervag/vimtex', { 'for': 'tex' }
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-unimpaired', { 'for': ['python', 'json', 'kotlin', 'lilypond', 'markdown'] }
    Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
call plug#end()

"set jedi-vim options
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
" let g:jedi#completions_command <C-A-space>

" map F8 to toggle the tagbar pluggin
 nmap <F8> :TagbarToggle<CR>

 " turn off easytags warning about ctags version
 let g:easytags_suppress_ctags_warning = 1

 " map <leader>f to vim-markdown's unfold-all command
 " and <leader>F to fold-all
 nmap <leader>f zR<CR>
 nmap <leader>F zM<CR>

 " set interval that vim-gitgutter uses when looking for changes
 set updatetime=100

 " toggle vim-gitgutter's highlighting of changed hunks
 nmap <leader>h :GitGutterLineHighlightsToggle<CR>

 " put airline on top instead of bottom
 let g:airline_statusline_ontop=1

 " bind keys to swtich between panes with C-[hjkl], mimicing cursor movement keys
 map <C-j> <C-W>j
 map <C-k> <C-W>k
 map <C-h> <C-W>h
 map <C-l> <C-W>l

 " set my defaults for nerdcommenter
 let g:NERDSpaceDelims = 1
 let g:NERDDefaultAlign = 'left'
 let g:NERDTrimTrailingWhitespace = 1

 " highlight the line the cursor is on with an underline
 set cursorline

 " PyMode settings
 let g:pymode_python = 'python3'     " Use Python 3 syntax
 let g:pymode_rope = 1               " turn on pymode's use of rope
 let g:pymode_lint_ignore = ["missing-docstring"]

 " vim-mucomplete settings
 set completeopt+=noselect
 set shortmess+=c " Shut off completion messages
 set belloff+=ctrlg " stop Vim from beeping all the time during autocompletion
 let g:mucomplete#enable_auto_at_startup = 1
 let g:mucomplete#completion_delay = 1

 " easytags settings test
 set tags=./.tags
 let g:easytags_dynamic_files = 1
 highlight pythonFunctionTag ctermfg=blue cterm=bold

map qq :qa<CR>
 map <C-W><C-W> <C-W><C-Q>

 " Commands to make running python code being edited easier
 set autowrite
 autocmd Filetype python setlocal makeprg=/usr/bin/env\ python\ %
 noremap m :make<CR>

 nmap <leader>gc :Gcommit %<cr>
 nmap <leader>gp :Gpush<cr>
 nmap <leader>gs :Gstatus<cr>

 " Enabling support for LilyPond music editing
 filetype off
 set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim

 filetype on
 syntax on
 set guicursor=n-v-c-sm:block,i-ci-ve:ver25-Cursor,r-cr-o:hor20

 " Enable line numbering
 set number relativenumber
 " set vimtex_compiler_program='nvm'
