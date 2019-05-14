# Cheatsheet of commands available through active plugins

|Binding                   |Function                                                                      |From plugin                            |
|------------------------- |----------------------------------------------------------------------------- |-------------------------------------- |
| zr | reduce fold level throughout the buffer | vim-markdown |
| zR | opens all folds | vim-markdown |
| zm | increases fold level throughout the buffer | vim-markdown |
| zM | folds everything all the way | vim-markdown |
| za | open a fold your cursor is on | vim-markdown |
| zA | open a fold your cursor is on recursively | vim-markdown |
| zc | close a fold your cursor is on | vim-markdown |
| ds\<target\><span id="a1">[[1]](#f1)</span> | Delete the surrounding character(s) designated by <target> | vim-surround<span id="b2">[[2]](#f2")</span> |
| cs\<target\><span id="a2">[[1]](#f1)</span> | Change the surrounding character(s) designated by <target> | vim-surround<span id="b2">[[2]](#f2")</span> |
| ys\<target\><span id="a3">[[1]](#f1)</span> | Create new surrounding character(s) designated by <target> | vim-surround<span id="b2">[[2]](#f2")</span> |
| v\<motion\>s\<target\><span id="a4">[[1]](#f1)</span> | Create new surrounding character(s) designated by \<argument\> | vim-surround<span id="b2">[[2]](#f2")</span> |

Footnotes
=========
1. <span id="f1"></span> In vim-surround <target> is used to designate the character(s) to be used to surround the text. vim-surround recognizes eith punctuation marks, (, ), {, }, [, ], <,and >, which represent themselves and their counterparts. If the opening mark is used, contained whitespace is also trimmed. The targets b, B, r, and a are aliases for ), }, ], and >. The first two mirror Vim. The second two are, [according to the vim-surround
documentation](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt) "arbitrary and subject to change".
2. <span id="f2"></span> vim-surround commands work with normal vim motion commands or text objects. For example, to surround two words with parenthesis, type ys2w). They also work with visual-mode selections, enclosing the selection by typing S with an argument after selecting text with the vim "v" instruction. Nmonics for remembering the prefixes are:
* d: delete
* c: change
* y: you create
* s: surround
