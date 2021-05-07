" =============================================================================
" File: cyberpunk.vim
" Description: Punchy cyberpunk colorscheme for vim
" Author: Alexander Goussas <agoussas@espol.edu.ec>
" Source: https://github.com/aloussase/cyberpunk
" Last Modified: 03 Feb 2020
" =============================================================================

highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "cyberpunk"

let s:fg = '#FF0055'
let s:bg = '#101116'

let s:white     = '#EEFFFF'
let s:red       = '#ff0055'
let s:yellow    = '#FFFC58'
let s:cyan      = '#00FFC8'
let s:blue      = '#76C1FF'
let s:purple    = '#311B92'
let s:turquoise = '#00FF84'

let s:dark_red  = '#140007'
let s:dark_blue = '#6766b3'
let s:dark_purple = '#372963'

let s:bright_blue   = '#00B0FF'
let s:bright_purple = '#D57BFF'

let s:termcolors = {
      \ s:fg:            196,
      \ s:bg:            233,
      \ s:white:         15,
      \ s:yellow:        227,
      \ s:red:           9,
      \ s:cyan:          49,
      \ s:blue:          153,
      \ s:purple:        5,
      \ s:turquoise:     87,
      \ s:dark_red:      52,
      \ s:dark_blue:     32,
      \ s:dark_purple:   92,
      \ s:bright_blue:   69,
      \ s:bright_purple: 135,
      \ }

function! HighlightFor(group, colors)
  let GetColor  = {color -> get(a:colors, color, "NONE")}
  let TermColor = {color, fallback -> get(a:colors, color, get(s:termcolors, fallback, 'NONE'))}

  execute "hi ".a:group
        \ ." guifg=".GetColor('gf')
        \ ." guibg=".GetColor('gb')
        \ ." gui=".GetColor('gui')
        \ ." ctermfg=".TermColor('tf', GetColor('gf'))
        \ ." ctermbg=".TermColor('tb', GetColor('gb'))
        \ ." cterm=".GetColor('gui')
endfunction

function! LinkColors(master, slaves)
  for slave in a:slaves
    execute "highlight! link ".slave." ".a:master
  endfor
endfunction

" General {{{

call HighlightFor("Normal", {'gf': s:fg,'gb': s:bg})
call HighlightFor("Visual", {'gb': s:purple})
call HighlightFor("ColorColumn", {'gb': '#182333'})
call HighlightFor("LineNr", {'gf': s:fg})
call HighlightFor("SignColumn", {'gf': s:cyan})

call HighlightFor("DiffAdd", {})
call HighlightFor("DiffChange", {})
call HighlightFor("DiffDelete",{'gb': '#ff1745'})
call HighlightFor("DiffText",  {'gb': s:turquoise})

call HighlightFor("VertSplit", {'gf': s:fg})

call HighlightFor("Search", {'gb': s:purple})
call LinkColors("Search", ["IncSearch", "Substitute"])

call HighlightFor("MatchParen", {'gb': s:cyan})
call HighlightFor("NonText",    {'gf': '#2B3E5A', 'tf':61})
call HighlightFor("Whitespace", {'gf': '#2B3E5A', 'tf':61})

call HighlightFor("WildMenu",  {'gf': s:cyan, 'gui': 'bold'})
call HighlightFor("Directory", {'gf': s:cyan})
call HighlightFor("Title",     {'gf': '#c592ff'})

" }}}
" Cursor {{{

call HighlightFor("Cursor", {'gb': s:purple})
call HighlightFor("CursorLine", {'gui': 'underline'})
call HighlightFor("CursorLineNr", {'gf': s:cyan})
call HighlightFor("CursorColumn", {})

" }}}
" Code {{{

" The following groups are not builtin but are defined commonly in syntax files

call HighlightFor("Comment", {'gf': s:dark_blue, 'gui': 'italic'})
call HighlightFor("String", {'gf': s:blue})

call HighlightFor("Number", {'gf': s:yellow})
call LinkColors("Number", ["Float", "Boolean", "Character"])

call HighlightFor("Label", {'gf': s:bright_blue})
call LinkColors("Label", ["Exception", "Conditional", "Repeat","Operator"])

call HighlightFor("Keyword", {'gf': s:bright_purple, 'gui': 'italic'})
call LinkColors("Keyword", ["StorageClass", "Statement"])

call HighlightFor("Identifier", {'gf': s:white})
call HighlightFor("Function",  {'gf': s:bright_blue})

call HighlightFor("PreProc", {'gf': s:cyan})
call LinkColors("PreProc", ["Type", "Structure", "Typedef"])

call HighlightFor("Underlined", {})
call HighlightFor("Todo", {'gf': s:cyan, 'gb': s:dark_purple, 'gui': 'italic'})
call HighlightFor("Error", {'gf': '#ff3270', 'gui': 'undercurl'})
call HighlightFor("WarningMsg", {'gf': '#009550'})
call HighlightFor("Special", {'gf': s:cyan, 'gui': 'italic'})
call HighlightFor("Tag", {'gf': '#00FF9C', 'gui': 'undercurl'})

" }}}
" Pmenu {{{

call HighlightFor("Pmenu",      {'gf': s:red, 'gb': s:dark_red })
call HighlightFor("PmenuSel",   {'gf': s:blue, 'gb': s:red})
call HighlightFor("PmenuSbar",  {'gb': s:red})
call HighlightFor("PmenuThumb",{})

" }}}
" Status line {{{

call HighlightFor("StatusLine", {'gf': s:red, 'gb': s:dark_red, 'gui':'bold'})
call HighlightFor("StatusLineNC", {'gf': s:red, 'gb': '#000000'})

" }}}
" Tab pages {{{

call HighlightFor("TabLine",     {'gf': s:red })
call HighlightFor("TabLineSel",  {'gf': s:red, 'gui': 'bold'})
call HighlightFor("TabLineFill", {})

" }}}
" Folds {{{

call HighlightFor("Folded", {'gf': s:cyan, 'gui': 'italic'})
call HighlightFor("FoldColumn", {'gf': s:cyan})

" }}}
