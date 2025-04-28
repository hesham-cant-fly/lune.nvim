" ~/.config/nvim/syntax/algo.vim

" Comments
syntax match luneComment "\-\-.*$"
syntax region luneBlockComment start="\-\-\[\[" end="\]\]"

" Keywords
syntax keyword luneKeywords var const local

" syntax keyword algoTypes entier reel booleen

" Variables
" syntax match algoVariables "\<\(a\|b\|tmp\)\>"

" Numbers
syntax match luneNumbers "\<\d\+\>"

" Highlighting
highlight link luneComment Comment
highlight link luneBlockComment Comment
highlight link luneKeywords Keyword
" highlight link algoVariables Identifier
highlight link luneNumbers Number
