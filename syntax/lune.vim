" ~/.config/nvim/syntax/algo.vim

" Comments
syntax match luneComment "--.*$"
syntax region luneComment start="--\[\[" end="\]\]"

" Statements
"" Function Declaration
syn region luneFunctionBlock transparent matchgroup=luneFunction start="\<function\>" end="\<end\>" contains=TOP

"" Conditionals
""" else
syn keyword luneCondElse matchgroup=luneCond contained containedin=luneCondEnd else
""" then ... end
syn region luneCondEnd contained transparent matchgroup=luneCond start="\<then\>" end="\<end\>" contains=TOP
""" elseif ... then
syn region luneCondElseif contained containedin=luneCondEnd transparent matchgroup=luneCond start="\<elseif\>" end="\<then\>" contains=TOP
" if ... then
syn region luneCondStart transparent matchgroup=luneCond start="\<if\>" end="\<then\>"me=e-4 contains=TOP nextgroup=luneCondEnd skipwhite skipempty

"" Control flow
""" do ... end
syn region luneBlock transparent matchgroup=luneStatement start="\<do\>" end="\<end\>" contains=TOP
""" repeat ... until
syn region luneRepeatBlock transparent matchgroup=luneRepeat start="\<repeat\>" end="\<until\>" contains=TOP
""" while ... do
syn region luneWhile transparent matchgroup=luneRepeat start="\<while\>" end="\<do\>"me=e-2 contains=TOP nextgroup=luneBlock skipwhite skipempty
""" for ... do and for ... in ... do
syn region luneFor transparent matchgroup=luneRepeat start="\<for\>" end="\<do\>"me=e-2 contains=TOP nextgroup=luneBlock skipwhite skipempty
syn keyword luneFor contained containedin=luneFor in

"" Other
syn keyword luneStatement return var const local break continue

syn keyword luneKeywords return break continue
syn keyword luneKeywords var const local global
syn keyword luneKeywords function end
syn keyword luneKeywords if then else elseif
syn keyword luneKeywords while for in do repeat until

" Types
syn keyword luneTypes number string boolean

" Functions
syn match luneFunc ":\@<=\k\+"
syn keyword luneFunc print rawget rawset self tonumber tostring type _VERSION

" Strings
syn match  luneSpecial contained #\\[\\abfnrtv'"[\]]\|\\[[:digit:]]\{,3}#
syn region luneString matchgroup=luneStringDelimiter start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=luneSpecial,@Spell
syn region luneString matchgroup=luneStringDelimiter start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=luneSpecial,@Spell

" Numbers
syn match luneNumber "\<\d\+\>"
syn match luneNumber "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\="
syn match luneNumber  "\.\d\+\%([eE][-+]\=\d\+\)\=\>"

" Highlighting
hi def link luneStatement       Statement
hi def link luneRepeat          Repeat
hi def link luneFor             Repeat
hi def link luneString          String
" hi def link luneString2       String
hi def link luneStringDelimiter luneString
hi def link luneComment         Comment
hi def link luneKeywords        Keyword
hi def link luneCond            Conditional
hi def link luneCondElse        Conditional
hi def link luneFunction        Function
hi def link luneFunc            Identifier
hi def link luneNumber          Number
