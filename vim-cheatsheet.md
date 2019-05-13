# Cheatsheet of commands available through active plugins

| Binding | Function | From plugin |
| ------- | -------- | ----------- |
| zr | reduce fold level throughout the buffer | vim-markdown |
| zR | opens all folds | vim-markdown |
| zm | increases fold level throughout the buffer | vim-markdown |
| zM | folds everything all the way | vim-markdown |
| za | open a fold your cursor is on | vim-markdown |
| zA | open a fold your cursor is on recursively | vim-markdown |
| zc | close a fold your cursor is on | vim-markdown |
| [ds<surrond>][1] | Delete the surrounding character(s) designated by <surround> | vim-surround |
| [cs<surround>][1] | Change the surrounding character(s) designated by <surround> | vim-surround |
| [ys<surround>][1] | Create new surrounding character(s) designated by <surround> | vim-surround |

[1]: vim-surround commands work with normal vim commands. For example, to surround two words with parenthesis, type ys2w).
