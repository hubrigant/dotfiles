# Cheatsheet of commands available through Tridactyl Firefox addon

|Binding                   |Function                                                                      |
|------------------------- |----------------------------------------------------------------------------- |
| Navigation within the current page |
| yy | copy page URL to clipboard |
| f/F/gF | enter "hint mode" to select a link to follow. F opens in a background tab. gF keeps opening links you select until ESC is pressed |
| r/R | reload/hard reload page |
| [[/]] | navigate forward/backward through paginated pages (e.g. comics, multi-part articles, search result pages, etc.) |
| gu | go to the parent of the current URL |
| gU | go to the root domain of the current URL |
| zi/zo/zz | zoom in/out/reset zoom |
| j/k | scroll up/down |
| h/l | scroll left/right |
| ^/$ | scroll to left/right margin |
| gg/G | scroll to start/end of page |
| \<C-f\>/\<C-b\> |jump to the next/previous part of the page (i.e. move down/up one screen height in the page) |
| Working with forms |
| gi | go to the first used input |
| tab/shift-tab | go to the next/previous input |
| :focusinput N | go to the Nth input |
| Find mode |
| / | open the find search box |
| \<C-g\>/\<C-G\> | find the next/previous instance of the last find operation (note: these are the standard Firefox shortcuts) |
| Bookmarks and quickmarks |
| A | bookmark the current page |
| a | bookmark the current page, but allow the URL to be modified first |
| M\<key\> | bind a quickmark to the given key |
| Navigating to new pages |
| o/O | open a URL (or default search) in this tab (O to pre-load current URL) |
| t/T | open a URL (or default search) in a new tab (T to pre-load current URL) |
| w/W | open a URL (or default search) in a new window (W to pre-load current URL) |
| p/P | open the clipboard contents in the current/new tab |
| s/S | force a search using the default Tridactyl search engine, opening in the current/new tab. This is useful when searching for something that would otherwise be treated as a URL by o or t |
| H/L | go back/forward in the tab history |
| Handling tabs |
| d | close the current tab |
| u | undo the last tab/window closure |
| gt/gT | go the the next/previous tab |
| g^/g$ | go to the first/last tab |
| b | bring up a list of open tabs in the current window; you can type the tab ID or part of the title or URL to choose a tab |

Footnotes
=========

1. <span id="f1"></span> In vim-surround <target> is used to designate the character(s) to be used to surround the text. vim-surround recognizes eith punctuation marks, (, ), {, }, [, ], <,and >, which represent themselves and their counterparts. If the opening mark is used, contained whitespace is also trimmed. The targets b, B, r, and a are aliases for ), }, ], and >. The first two mirror Vim. The second two are, [according to the vim-surround
documentation](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt) "arbitrary and subject to change".
2. <span id="f2"></span> vim-surround commands work with normal vim motion commands or text objects. For example, to surround two words with parenthesis, type ys2w). They also work with visual-mode selections, enclosing the selection by typing S with an argument after selecting text with the vim "v" instruction. Nmonics for remembering the prefixes are:
    <sup>*</sup>d: delete
    <sup>*</sup>c: change
    <sup>*</sup>y: you create
    <sup>*</sup>s: surround
3. <span id="f3"></span> Tabular supports an optional format specification after the pattern to control how the alignment occurs. For information, consult [the tabular documentation](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt?_sm_au_=iVVrL6DSJJ8J6r6j).
