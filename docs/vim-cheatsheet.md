# Cheatsheet of commands available through active plugins

|Binding                   |Function                                                                      |From plugin                            |
|------------------------- |----------------------------------------------------------------------------- |-------------------------------------- |
| zr | reduce fold level throughout the buffer | vim-markdown |
| zR | opens all folds | vim-markdown |
| \<leader\>f | opens all folds | vim-markdown |
| zm | increases fold level throughout the buffer | vim-markdown<sup>*</sup>|
| \<leader\>F | increases fold level throughout the buffer | vim-markdown<sup>*</sup>|
| zM | folds everything all the way | vim-markdown |
| za | open a fold your cursor is on | vim-markdown |
| zA | open a fold your cursor is on recursively | vim-markdown |
| zc | close a fold your cursor is on | vim-markdown |
| ds\<target\><span id="a1">[[1]](#f1)</span> | Delete the surrounding character(s) designated by <target> | vim-surround<sup>+</sup><span id="b2">[[2]](#f2")</span> |
| cs\<target\><span id="a2">[[1]](#f1)</span> | Change the surrounding character(s) designated by <target> | vim-surround<sup>+</sup><span id="b2">[[2]](#f2")</span> |
| ys\<target\><span id="a3">[[1]](#f1)</span> | Create new surrounding character(s) designated by <target> | vim-surround<sup>+</sup><span id="b2">[[2]](#f2")</span> |
| v\<motion\>s\<target\><span id="a4">[[1]](#f1)</span> | Create new surrounding character(s) designated by \<argument\> | vim-surround<sup>+</sup><span id="b2">[[2]](#f2")</span> |
| [c | jump to previous changed hunk | vim-gitgutter |
| ]c | jump to next changed hunk | vim-gitgutter |
| \<leader\>hp | preview changed hunk | vim-gitgutter |
| \<leader\>hs | stage changed hunk | vim-gitgutter |
| \<leader\>hu | undo hunk | vim-gitgutter |
| \<leader\>g | enable highlighting of changed lines | vim-gitgutter<sup>*</sup>|
| \<leader\>g | disable highlighting of changed lines | vim-gitgutter<sup>*</sup>|
| \<leader\>h | toggle highlighting of changed lines | vim-gitgutter |
| \<leader\>hs | stage the current hunk | vim-gitgutter |
| \<leader\>hu | undo the current hunk | vim-gitgutter |
| \<leader\>hp | preview the current hunk | vim-gitgutter |
| :FixTrailingWhitespace | trim off whitespace at the ends of lines | vim-trailing-whitespace |
| :Tabularize /\<pattern\>[\<format spec\>]<span id="a4">[[3]](#f3)</span> | align text in multiple lines along the characters matched by \<pattern\> | tabular<sup>+</sup> |
| \<C-p\> | activate CtrlP | ctrlp.vim |
| \<F5\> | when CtrlP is active, purge the cache for the current directory to get new files, etc. | ctrlp.vim |
| \<C-f\>\/\<C-b\> | cycle betwen CtrlP modes (find file\/buffer\/MRU file\/mixed) | ctrlp.vim |
| \<C-d\> | when CtrlP is active, switch to filename only search instead of full path | ctrlp.vim |
| \<C-r\> | when CtrlP is active, switch to regex mode | ctrlp.vim |
| \<C-j\>\/\<C-k\> | navigate the CtrlP result list | ctrlp.vim |
| \<C-t\>\/\<C-v\>\<C-x\> | open the selected entry in a new tab or split | ctrlp.vim |
| .. | submit two or more dots to go up the directory tree by one or multiple levels | ctrlp.vim |
| \<leader\>cc | comment out current line or text selected in visual mode | nerdcommenter<sup>+</sup> |

Footnotes
=========

<sup>\*</sup>Entries marked with an asterix (*) denote my own bindings for plugin-provided functionality.  
<sup>+</sup>Entries marked with a plus sign (+) denote commands that work with Vim's visual mode selection.

1. <span id="f1"></span> In vim-surround <target> is used to designate the character(s) to be used to surround the text. vim-surround recognizes eith punctuation marks, (, ), {, }, [, ], <,and >, which represent themselves and their counterparts. If the opening mark is used, contained whitespace is also trimmed. The targets b, B, r, and a are aliases for ), }, ], and >. The first two mirror Vim. The second two are, [according to the vim-surround
documentation](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt) "arbitrary and subject to change".
2. <span id="f2"></span> vim-surround commands work with normal vim motion commands or text objects. For example, to surround two words with parenthesis, type ys2w). They also work with visual-mode selections, enclosing the selection by typing S with an argument after selecting text with the vim "v" instruction. Nmonics for remembering the prefixes are:
    <sup>*</sup>d: delete
    <sup>*</sup>c: change
    <sup>*</sup>y: you create
    <sup>*</sup>s: surround
3. <span id="f3"></span> Tabular supports an optional format specification after the pattern to control how the alignment occurs. For information, consult [the tabular documentation](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt?_sm_au_=iVVrL6DSJJ8J6r6j).
